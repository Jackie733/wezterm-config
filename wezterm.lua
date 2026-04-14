local Config = require("config")

require("utils.backdrops"):scan_images_dir():random()

return Config:init()
	:append(require("config.appearance"))
	:append(require("config.fonts"))
	:append(require("config.general"))
	:append(require("config.domains"))
	:append(require("config.launch"))
	:append(require("config.keys")).options
