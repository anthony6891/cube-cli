package = "cube-cli"
version = "0.1-2"
source = {
   url = "git://github.com/nonsensews/cube-cli",
   tag = "0.1.2",
}
description = {
   summary = "An artifact discovered full of SHA/OS seeds.",
   detailed = [[
      Research of Cube's origin and functions are still ongoing.
      For more info, see https://nonsense.ws
   ]],
   homepage = "https//shaos.ws",
   license = "AGPL"
}
dependencies = {
   "lua == 5.1",
   "lzmq",
   "argparse",
   "socket",
   "uuid"
}

build = {
  type = 'builtin',
  modules = {
    ['cube.errors']      = 'cube/errors.lua',
    ['cube.handlers']    = 'cube/handlers.lua',
    ['cube.messages']    = 'cube/messages.lua',
    ['cube.system']      = 'cube/system.lua',
    ['cube.tools']       = 'cube/tools.lua',
    ['cube.init']        = 'cube/init.lua',
  },
  install = {
    bin = {
      ['cube-cli'] = 'bin/cube-cli'
    }
  }
}