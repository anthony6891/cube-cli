--
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
   description = "An artifact discovered full of https://shaos.ws seeds.",
   epilog = "Research of the SHA/OS Cube's origin and function are still ongoing. " ..
            "\nFor more info, see https://nonsense.ws."
}
-- treehouse build and erlang release directory
parser:option("-s --spawn", "build node on location", "/opt/treehouse")
parser:option("-u --unit", "unit hash", "f99de75fa5bd30ac31505fd7487d6086")
parser:option("-q --query", "query https://underworld.ws hash index", "starcraft")
-- cube-cli command
parser:command_target("command")
parser:command("install")
parser:command("start")
parser:command("stop")
parser:command("ping")
parser:command("purge")
parser:command("pull")
parser:command("build")
parser:command("execute")
parser:command("consume")
parser:command("remove")
parser:command("search")
parser:command("update")
parser:command("upgrade")
parser:command("status")
-- local command and repo variables
local hashs = "curl https://underworld.ws/hashs/"
local create = "singularity create ~/.hashs/"
local expand = "singularity expand ~/.hashs/"
local bootstrap = "sudo singularity bootstrap ~/.hashs/"
local run = "singularity run --writable ~/.hashs/"
local treehouse = "git clone https://github.com/nonsensews/treehouse"
-- parse cli arguments
local args = parser:parse()
-- until more complete implementation print args on exec time.
print(args)
-- rage against the state machine
if args['command'] == 'install' then
    os.execute(treehouse .. " " .. args['spawn'])
    os.execute("curl -O https://erlang.mk/erlang.mk")
    os.execute("mv erlang.mk " .. args['spawn'])
    -- if crash remove erlang.mk from current directory.
    os.execute("rm erlang.mk")
    os.execute("cd " .. args['spawn'] .." && make all")
elseif args['command'] == 'start' then
    os.execute(args['spawn'] .. release .. " start")
elseif args['command'] == 'stop' then
    os.execute(args['spawn'] .. release .. " stop")
elseif args['command'] == 'ping' then
    os.execute(args['spawn'] .. release .. " ping")
elseif args['command'] == 'purge' then
    os.execute("rm -Rf " .. args['spawn'])
    os.execute("rm -Rf ~/.hashs")
elseif args['command'] == 'pull' then
    os.execute("mkdir -p ~/.hashs")
    os.execute(hashs ..
        args['unit'] ..
        ".img -o ~/.hashs/" ..
        args['unit'] ..
        ".img")
elseif args['command'] == 'build' then
    os.execute("mkdir -p ~/.hashs")
    os.execute(hashs ..
        "index/" ..
        args['unit'] ..
        ".def -o ~/.hashs/" ..
        args['unit'] ..
        ".def")
    os.execute("rm -Rf ~/.hashs/" .. args['unit'] .. ".img")
    os.execute(create .. args['unit'] .. ".img")
    os.execute(expand .. args['unit'] .. ".img")
    os.execute(expand .. args['unit'] .. ".img")
    os.execute(bootstrap ..
        args['unit'] ..
        ".img ~/.hashs/" ..
        args['unit'] ..
        ".def")
elseif args['command'] == 'execute' then
    os.execute(run .. args['unit'] .. ".img")
elseif args['command'] == 'consume' then

    print('consume a singularity definition file if pass else do?')
--    os.execute(run .. args['unit'] .. ".img")

elseif args['command'] == 'remove' then
    os.execute("rm -Rf ~/.hashs/" .. args['unit'] .. ".img")
elseif args['command'] == 'search' then
    print('search')
elseif args['command'] == 'update' then
    os.execute("sudo apt-get update")
elseif args['command'] == 'upgrade' then
    os.execute("sudo aptitude dist-upgrade -y")
elseif args['command'] == 'status' then
    print('status')
else
    print('do something else')
end
