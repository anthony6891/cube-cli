-- Simplify the task of building fast and scalable network applications.
-- Use message passing, event-driven, non-blocking, asynchronous,
-- concurrent, no shared memory, no multi-thread design.
--
-- And Now for Something Completely Different 
--
-- require lua modules
local zmq = require("lzmq")
local argparse = require("argparse")
local socket = require("socket")
local uuid = require("uuid")
-- init random seed
uuid.randomseed(socket.gettime()*10000)
-- Session UUID
local session_uuid = uuid()
-- Erlang/OTP release
local release = "/_rel/treehouse_release/bin/treehouse_release"
-- Parse CLI arguments
local parser = argparse() {
   name = "cube-cli.lua",
   description = "An artifact discovered full of https://cloudforest.ws seeds.",
   epilog = "Research of the SHA/OS Cube's origin and function are still ongoing. " .. 
            "\nFor more info, see https://nonsense.ws."
}
-- treehouse build and release directory
parser:option("-b --build", "build node on location", "/opt/treehouse")
-- cube-cli command
parser:command_target("command")
parser:command("install")
parser:command("purge")
parser:command("start")
parser:command("stop")
parser:command("exec")
parser:command("upgrade")
parser:command("search")
parser:command("ping")
parser:command("join")
parser:command("leave")
parser:command("status")
-- parse cli arguments
local args = parser:parse()
-- until more complete implementation print args on exec time.
print(args)
-- rage against the state machine
if args['command'] == 'install' then
    os.execute("git clone https://github.com/nonsensews/treehouse " .. args['build'])
    os.execute("curl -O https://erlang.mk/erlang.mk")
    os.execute("mv erlang.mk " .. args['build'])
    -- if crash remove erlang.mk from current directory.
    os.execute("rm erlang.mk")
    os.execute("cd " .. args['build'] .." && make all")
elseif args['command'] == 'start' then
    os.execute(args['build'] .. release .. " start")
elseif args['command'] == 'stop' then
    os.execute(args['build'] .. release .. " stop")
elseif args['command'] == 'exec' then
    print('container exec')
elseif args['command'] == 'ping' then
    os.execute(args['build'] .. release .. " ping")
elseif args['command'] == 'status' then
    print('status')
elseif args['command'] == 'upgrade' then
    print('upgrade')
elseif args['command'] == 'search' then
    print('search')
elseif args['command'] == 'leave' then
    print('leave')
elseif args['command'] == 'join' then
    print('join')
elseif args['command'] == 'purge' then
    os.execute("rm -Rf " .. args['build'])
else
    print('do something else')
end