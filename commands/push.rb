name        'push'
usage       'push'
#aliases     :ghpages
summary     'pushes to master and pushes output to gh-pages branch'
description <<-DESC
Pushes to master and pushes output to gh-pages branch.
DESC

flag :h, :help, 'show help for this command' do |value, cmd|
  puts cmd.help
  exit 0
end

run do |opts, args, cmd|
  system 'git push'
  system 'git subtree push --prefix output origin gh-pages'
end
