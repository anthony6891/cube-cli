package = "cube-cli"
version = "0.1-3"
source = {
   url = "git://github.com/nonsensews/cube-cli",
   tag = "0.1.3",
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
   "luasocket",
   "uuid"
}

build = {
  type = 'builtin',
  modules = {
      ['cube.version'] = "cube/version.lua"
   },
  install = {
    bin = {
      ['cube-cli'] = 'cube-cli.lua'
    }
  }
}