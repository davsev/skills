---
name: whatsapp-archive-tracker
description: Scan affiliate and deals groups in the WhatsApp Web archive, reconcile group admins by unique phone number in an existing Google Sheets outreach tracker, or audit conversation status. Use for rescan, sync, missing group, or WhatsApp follow-up tracking requests.
---

# WhatsApp archive tracker

Use the user's signed-in WhatsApp Web session and the tracker they identify. In the Affilify tracker, גיליון1 is the group inventory and גיליון2 is the contact tracker. Resolve the active sheet and column positions from headers and sample rows. For an outreach or copywriting request, use the requested scope and wording rather than any old message from the tracker.

## Scan the archive

1. Open **Archived** in WhatsApp Web. Prefer the connected browser tab that is already signed in. If none is usable, ask the user to connect WhatsApp Web. Stay in WhatsApp's visible UI.
2. The archive is virtualized and mixes groups with private chats. Scroll in overlapping increments from one end to the other. If rendered row IDs repeat at different positions, use observed row offsets to check coverage within the pass. Keep the original title and distinguish groups that share a title when a reliable identity is visible. Report gaps or inaccessible sections rather than treating the first screen as the full archive.
3. Compare against the destination sheet. Group titles may contain directional marks, nonbreaking spaces, emoji and punctuation. Normalize those for a candidate comparison while retaining group numbers and original display titles. A similar title is not a verified match. If available, use the same existing invitation link or another reliable visible identifier to resolve ambiguity. Never generate or reset an invite link during a scan.
4. Read **Group info** and the participant list for groups in scope. Identify admins by the visible admin badge and verify which number belongs to each of them in that same participant's contact details. A post author, group description, matching display name or separate list order does not establish admin identity. If a number is hidden, record it as unavailable. In group-inventory mode, capture visible group descriptions and existing invite links when requested.

## Update the contact tracker

- Inspect the live sheet just before writing. Treat phone numbers as text and use a canonical international number as the matching key. Strip formatting and directional marks. For clearly Israeli local numbers, replace the trunk zero with +972. Preserve other explicit country codes and leave ambiguous numbers unresolved.
- For a missing group and an existing number, append the group to that number's existing group cell, using the sheet's established separator. Preserve other group memberships. For a new number, append one row with the verified number and all its verified groups from the pass. Add the original display name if verified. Set the greeting name only when a personal name is clear.
- Aggregate the full batch by phone before writing so a shared admin receives one row. Where existing rows already duplicate a number, avoid a new row for it. If the existing rows carry conflicting history, flag the conflict for review before merging or deleting them.
- Preserve the existing links, formulas, dates, manual names and status values. Respect repeated headers and blank separators. Use targeted writes to the group cells and append new rows below the data. Read back changed cells and confirm each new number appears once and each expected association is present. Repeating the same scan should produce no duplicate associations.
- If asked to add click-to-chat links, use the international digits without spaces, dashes or a plus, and URL-encode the message as a query value. For an absent greeting name, omit the name and clean up the punctuation. Test that the link opens a draft for the intended number without sending.

## Audit conversation status

Only when requested, open the direct conversation for each verified number and inspect visible incoming and outgoing messages. Record whether the conversation is empty, whether the outreach was sent with no reply, or whether a reply followed it. Use an explicit unresolved value for unavailable history, unrelated prior messages or ambiguous replies. An unsuccessful search, a draft or a system notice is not proof of an empty conversation. Keep a recorded send date unless the evidence supports a correction.

A scan or a tracker update does not authorize sending WhatsApp messages. Follow applicable browser confirmation requirements for the exact action and destination. When reporting results, provide counts of groups checked, new numbers, existing rows updated and unresolved cases. Keep private numbers and chat text out of the skill and routine summaries.
