local ls = require("luasnip")

-- shortcuts
local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node

ls.config.set_config({
    store_selection_keys = '<A-s>',
})

ls.add_snippets(nil, {
    all = {
        snip({
            trig = "pwn_setup",
            namr = "PWN_Setup",
            dscr = "Basic setup for ctf pwning tasks.",
        }, {
            text({ "import socket",
                "import struct",
                "",
                "HOST, PORT = \"localhost\", 1337",
                "# HOST, PORT = \"" }), insert(1, "host"), text("\", "), insert(2, "port"),
            text({ "",
                "def p64(x): return struct.pack(\"Q \", x)",
                "def u64(x): return struct.unpack(\"Q\", x + b\"\\x00\" * (8 - len(x)))[0]",
                "",
                "",
                "s = socket.socket()",
                "s.connect((HOST, PORT))",
                "",
                "def recv_until(c):",
                "    b = b\"\"",
                "    a = s.recv(1)",
                "    b += a",
                "    while a != c:",
                "        a = s.recv(1)",
                "        b += a",
                "    return b"

            })
        }),
        snip({
                trig = "pwn_setup_wrap",
                namr = "PWN_Setup_wrap",
                dscr = "Basic setup for ctf pwning tasks, setting host and port"
            },
            {
                text({ "import socket",
                    "import struct",
                    "",
                    "HOST, PORT = \"localhost\", 1337",
                    "" }),
                func(function(_, snip)
                    local x = {}
                    for word in snip.env.TM_SELECTED_TEXT[1]:gmatch("%S+") do
                        table.insert(x, word)
                    end
                    if #x ~= 2 then
                        return "# HOST, PORT = "
                    end
                    return ("# HOST, PORT = \"" .. x[1] .. "\", " .. x[2]) or {}
                end, {}),
                text({ "",
                    "def p64(x): return struct.pack(\"Q \", x)",
                    "def u64(x): return struct.unpack(\"Q\", x + b\"\\x00\" * (8 - len(x)))[0]",
                    "",
                    "",
                    "s = socket.socket()",
                    "s.connect((HOST, PORT))",
                    "",
                    "def recv_until(c):",
                    "    b = b\"\"",
                    "    a = s.recv(1)",
                    "    b += a",
                    "    while a != c:",
                    "        a = s.recv(1)",
                    "        b += a",
                    "    return b"

                })
            }),
    },

})
