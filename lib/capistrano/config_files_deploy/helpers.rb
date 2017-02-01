module Capistrano
  module ConfigFilesDeploy
    module Helpers
      def config_repo_path
        deploy_to = fetch(:deploy_to)
        if(deploy_to.nil?)
          warn 'config_files_deploy: deploy_to is not set'
        end
        "#{deploy_to}/config_repo"
      end
    end
  end
end
