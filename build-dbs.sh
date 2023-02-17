#!/bin/bash

# Cloudflare
rm -f cloudflare.db
cat cloudflare.json | jq '[
  .data.viewer.zones[].zones[] | 
  {
    timeslot: .dimensions.timeslot,
    pageViews: .sum.pageViews,
    uniques: .uniq.uniques,
    bytes: .sum.bytes,
    cachedBytes: .sum.cachedBytes,
    requests: .sum.requests,
    cachedRequests: .sum.cachedRequests
  }
]' | sqlite-utils insert cloudflare.db timeslots - --pk timeslot

# Plausible
rm -f plausible.db
csvs-to-sqlite plausible-csvs/*.csv plausible.db
