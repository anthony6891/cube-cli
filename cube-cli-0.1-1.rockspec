package = "cube-cli"
version = "0.1-1"
source = {
   url = "git://github.com/nonsensews/cube-cli",
   tag = "0.1.1",
}
description = {
   summary = "An artifact discovered full of https://shaos.ws seeds.",
   detailed = [[
      Research of SHA/OS Cube's origin and functions are still ongoing.
      For more info, see https://nonsense.ws
   ]],
   homepage = "https//shaos.ws",
   license = "AGPL"
}
dependencies = {
   "lua >= 5.1, < 5.4",
   "lzmq",
   "argparse",
   "socket",
   "uuid"
}
