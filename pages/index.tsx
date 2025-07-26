import Head from 'next/head'

export default function Home() {
  return (
    <div>
      <Head>
        <title>GitHub Trending RSS</title>
      </Head>
      <main style={{padding:'2rem'}}>
        <h1>GitHub Trending RSS</h1>
        <p>Use /api/rss?language=javascript to get an RSS feed.</p>
      </main>
    </div>
  )
}
