import type { NextApiRequest, NextApiResponse } from 'next'
import cheerio from 'cheerio'

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
  const language = (req.query.language as string) || 'all'
  const period = (req.query.since as string) || 'daily'
  try {
    const response = await fetch(`https://github.com/trending/${encodeURIComponent(language)}?since=${period}`)
    const html = await response.text()
    const $ = cheerio.load(html)
    const items: {title:string, link:string, description:string}[] = []
    $('article.Box-row').each((_, el) => {
      const a = $(el).find('h2 a')
      const href = a.attr('href') || ''
      const title = a.text().trim().replace(/\s+/g,' ')
      const link = `https://github.com${href}`
      const desc = $(el).find('p').first().text().trim()
      items.push({title, link, description: desc})
    })

    const feedItems = items.map(item => `\n    <item>\n      <title>${item.title}</title>\n      <link>${item.link}</link>\n      <description>${item.description}</description>\n    </item>`).join('')

    const rss = `<?xml version="1.0" encoding="UTF-8"?>\n<rss version="2.0">\n  <channel>\n    <title>GitHub ${language} Trending</title>\n    <link>https://github.com/trending/${language}</link>\n    <description>Trending repositories on GitHub</description>${feedItems}\n  </channel>\n</rss>`

    res.setHeader('Content-Type', 'application/rss+xml')
    res.status(200).send(rss)
  } catch (err) {
    res.status(500).json({ error: 'Failed to fetch trending page' })
  }
}
