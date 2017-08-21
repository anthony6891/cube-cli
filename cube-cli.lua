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
parser:option("-s --spawn", "build node on location", "/opt/treehouse")
parser:option("-c --container", "install singularity container", "broodwar")
-- cube-cli command
parser:command_target("command")
parser:command("install")
parser:command("start")
parser:command("stop")
parser:command("ping")
parser:command("purge")
parser:command("pull")
parser:command("build")
parser:command("run")
parser:command("checkout")
-- parse cli arguments
local args = parser:parse()
-- until more complete implementation print args on exec time.
print(args)
-- rage against the state machine
if args['command'] == 'install' then
    os.execute("git clone https://github.com/nonsensews/treehouse " .. args['spawn'])
    os.execute("curl -O https://erlang.mk/erlang.mk")
    os.execute("mv erlang.mk " .. args['spawn'])
    -- if crash remove erlang.mk from current directory.
    os.execute("rm erlang.mk")
    os.execute("cd " .. args['spawn'] .." && make all")
elseif args['command'] == 'start' then
    os.execute(args['build'] .. release .. " start")
elseif args['command'] == 'stop' then
    os.execute(args['build'] .. release .. " stop")
elseif args['command'] == 'ping' then
    os.execute(args['build'] .. release .. " ping")
elseif args['command'] == 'purge' then
    os.execute("rm -Rf " .. args['build'])
    os.execute("rm -Rf ~/.containers")
elseif args['command'] == 'pull' then
    os.execute("mkdir -p ~/.containers")
    os.execute("curl https://underworld.ws/containers/" .. args['container'] .."/" .. args['container'] ..".img -o ~/.containers/" .. args['container'] ..".img")
elseif args['command'] == 'build' then
    os.execute("mkdir -p ~/.containers")
    os.execute("curl https://underworld.ws/containers/" .. args['container'] .."/Singularity -o ~/.containers/" .. args['container'] ..".def")
    "singularity create torchcraft.img"
    singularity expand torchcraft.img
    singularity expand torchcraft.img
    singularity expand torchcraft.img
    sudo singularity bootstrap torchcraft.img work/planets/underworld/build/containers/torchcraft/Singularity
elseif args['command'] == 'run' then
    print('run')
elseif args['command'] == 'checkout' then
    print('checkout')
else
    print('do something else')
end