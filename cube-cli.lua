-- Simplify the task of building fast and scalable network applications.
-- Use a message passing, event-driven, non-blocking, no share memory, no thread design.

-- require lua modules
local zmq = require("lzmq")
local argparse = require("argparse")
local socket = require("socket")
local uuid = require("uuid")

-- init uuid random seed
uuid.randomseed(socket.gettime()*10000)

-- System UUID
local system_uuid = uuid()