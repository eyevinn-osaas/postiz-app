# Postiz on Eyevinn Open Source Cloud

Postiz is the ultimate social media scheduling tool with AI capabilities. Schedule posts, manage multiple social media accounts, and leverage AI to create compelling content — all from a single platform.

## Features

- Schedule posts across all major social media platforms
- AI-powered content generation
- Team collaboration support
- Analytics and performance tracking
- OAuth integrations for X, LinkedIn, Reddit, Facebook, YouTube, TikTok, Pinterest, Discord, Slack, Mastodon, and more

## Quick Start on OSC

Deploy Postiz on Eyevinn Open Source Cloud with a single click. You will need:

- A PostgreSQL database URL (`DATABASE_URL`)
- A Redis URL (`REDIS_URL`)
- A JWT secret (`JWT_SECRET`)

Optional but recommended:
- Social media API keys for the platforms you want to integrate
- OpenAI API key for AI content generation

## Environment Variables

| Variable | Required | Description |
|----------|----------|-------------|
| `DATABASE_URL` | Yes | PostgreSQL connection URL |
| `REDIS_URL` | Yes | Redis connection URL |
| `JWT_SECRET` | Yes | Secret for JWT token signing |
| `DISABLE_REGISTRATION` | No | Set to `true` to disable new user registration |
| `OPENAI_API_KEY` | No | OpenAI API key for AI features |
| `X_API_KEY` / `X_API_SECRET` | No | X (Twitter) API credentials |
| `LINKEDIN_CLIENT_ID` / `LINKEDIN_CLIENT_SECRET` | No | LinkedIn OAuth credentials |
| `FACEBOOK_APP_ID` / `FACEBOOK_APP_SECRET` | No | Facebook/Instagram credentials |

See the full list of supported social media integrations in [the official documentation](http://docs.postiz.com/configuration/reference).

## Links

- [Official Documentation](http://docs.postiz.com)
- [GitHub Repository](https://github.com/gitroomhq/postiz-app)
- [Eyevinn Open Source Cloud](https://www.osaas.io)
