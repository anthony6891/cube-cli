-- Simplify the task of building fast and scalable network applications.
-- Use message passing, event-driven, non-blocking,
-- asynchronous, no shared memory, no multi-thread design.
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
local parser = argparse() {
   name = "cube-cli",
   description = "An artifact discovered full of https://cloudforest.ws seeds.",
   epilog = "Research of the Cube's function are still ongoing. \nFor more info, see https://nonsense.ws."
}
-- treehouse build and release directory
parser:option("-b --build", "build node on location", "/opt/treehouse")
-- cube-cli command
parser:command_target("command")
parser:command("install")
parser:command("purge")
parser:command("start")
parser:command("stop")
parser:command("ping")
parser:command("status")
-- parse cli arguments
local args = parser:parse()
-- until more complete implementation print current arguments on execution time.
print(args)
if args['command'] == 'install' then
    os.execute("git clone https://github.com/nonsensews/treehouse " .. args['build'])
    os.execute("curl -O https://erlang.mk/erlang.mk")
    os.execute("mv erlang.mk " .. args['build'])
    os.execute("rm erlang.mk")
    os.execute("cd " .. args['build'] .." && make all")
elseif args['command'] == 'start' then
    print('start')
    os.execute(args['build'] .. "/_rel/treehouse_release/bin/treehouse_release start")
elseif args['command'] == 'stop' then
    print('stop')
    os.execute(args['build'] .. "/_rel/treehouse_release/bin/treehouse_release stop")
elseif args['command'] == 'ping' then
    os.execute(args['build'] .. "/_rel/treehouse_release/bin/treehouse_release ping")
elseif args['command'] == 'status' then
    print('status')
elseif args['command'] == 'purge' then
    os.execute("rm -Rf " .. args['build'])
else
    print('do something else')
end