---------------
--  Options  --
---------------

options.timeout = 1200
options.create = true
options.subscribe = true
options.expunge = true
-- options.recover = true

package.path = package.path .. ';' .. os.getenv("HOME") .. '/.imapfilter/?.lua'

require("accounts")
require("filters.filters")

account.INBOX:check_status()

apply_filters(account)
