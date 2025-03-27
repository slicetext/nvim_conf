require('code_runner').setup({
  filetype = {
	  python = "cd $dir && python3 -u",
	  cpp = "cd $dir && g++ $file && ./a.out",
	  lua = "cd $dir && lua $file",
	  sh = "cd $dir && bash $file",
	  c = "cd $dir && clang++ --debug $file -o a.out && ./a.out",
	  html="firefox $file",
  }
})
