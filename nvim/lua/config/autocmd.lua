-- Assembly filetype detection
vim.filetype.add({
	extension = {
		nasm = "asm", -- NASM source
		s = "asm", -- GNU Assembly source
		S = "asm", -- Preprocessed GNU Assembly
	},
})
