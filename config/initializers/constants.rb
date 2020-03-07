# pulls from the capistrano directory structure
def self.deploy_timestamp
  if Rails.env.production?
    Rails.root.split.last
  else
    "Undeployed"
  end
end

# returns the current GIT revision number
# with workaround: count of all commits
def self.git_revision
  cache_folder = File.join(::Rails.root.to_s, '../../shared/cached-copy/')
  if File.exists? cache_folder
    return `cd #{cache_folder} && git rev-list HEAD|wc -l`.strip
  elsif File.exists? File.join(::Rails.root.to_s, ".git")
    return `git rev-list HEAD|wc -l`.strip
  end
end

def self.get_hash_from_git
    cache_folder = File.join(::Rails.root.to_s, '../../shared/cached-copy/')
  if File.exists? cache_folder
    return `cd #{cache_folder} && git show --pretty=format:%H|head -n1|cut -c 1-6`.strip
  elsif File.exists? File.join(::Rails.root.to_s, ".git")
    return `git show --pretty=format:%H|head -n1|cut -c 1-6`.strip
  end
end

# revision number of project
REVISION = self.git_revision unless defined? REVISION
# timestamp of last deployment
DEPLOY_TIME = self.deploy_timestamp unless defined? DEPLOY_TIME

# System information
if defined? JRUBY_VERSION
  RUBYVERSION = "#{RbConfig::CONFIG['ruby_version']} - #{JRUBY_VERSION}"
else
  RUBYVERSION = RbConfig::CONFIG['ruby_version']
end
SYSCONFIG = RbConfig::CONFIG
SYSNAME = RbConfig::CONFIG['host_os']
SYSVENDOR = RbConfig::CONFIG['host_vendor']
SYSMASHINE = RbConfig::CONFIG['host_cpu']
# RUBY_COPYRIGHT
# RUBY_DESCRIPTION
# ENV_JAVA
