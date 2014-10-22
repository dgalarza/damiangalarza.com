require "rake"

task :clean do
  if File.directory? "build"
    FileUtils.rm_r("build")
  end
end

task :build do
  `middleman build`
end

task :deploy => [:clean, :build] do
  `middleman deploy`
end
