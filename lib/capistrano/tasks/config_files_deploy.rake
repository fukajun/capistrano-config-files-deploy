# set :config_files              # { '.env.production' => '.env.production', 'config/settings.yml.production' => 'config/setttings.yml' }
# set :config_files_git_url      # ENV['CONFIG_GIT_URL"] OR "git://github.com/foo/bar"
# set :config_files_git_rivision # 'master'
# set :config_files_roles        # :all
include Capistrano::ConfigFilesDeploy::Helpers

set_if_empty :config_files, {}
set_if_empty :config_files_git_revision, 'master'
set_if_empty :config_files_roles, :all

namespace :config_files do
  desc 'Download config files from remote git repository'
  task :download do
    on roles(fetch(:config_files_roles) do |host|
      if test "[ -e #{config_repo_path} ]"
        execute 'rm', '-rf', config_repo_path
      end
      execute 'git', 'clone', fetch(:config_files_git_url), config_repo_path
    end
  end

  task :checkout_revision do
    on roles(fetch(:config_files_roles) do |host|
      fetch(:config_files).each do |source_path, dest_path|
        execute 'git', '-C', config_repo_path, 'checkout', fetch(:config_files_git_revision)
      end
    end

  task :copy_files do
    on roles(fetch(:config_files_roles) do |host|
      fetch(:config_files).each do |source_path, dest_path|
        execute 'cp', '-f', "#{config_repo_path}/#{source_path}", "#{release_path}/#{dest_path}"
      end
    end
  end

  task :remove_tmp_files do
    on roles(fetch(:config_files_roles) do |host|
      execute 'rm', '-rf', config_repo_path
    end
  end

  desc 'Install each config files'
  task :install do
    invoke 'config_files:download'
    invoke 'config_files:checkout_revision'
    invoke 'config_files:copy_files'
    invoke 'config_files:remove_tmp_files'
  end

  before 'deploy:publishing', 'config_files:install'
end
