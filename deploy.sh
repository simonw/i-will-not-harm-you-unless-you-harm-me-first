#!/bin/bash
datasette publish vercel \
  plausible.db \
  cloudflare.db \
  --install datasette-vega \
  --project i-will-not-harm-you-unless-you-harm-me-first \
  --scope datasette
