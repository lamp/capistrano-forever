namespace :forever do
  desc "Start forever process"
  task :start do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        execute :forever, "start", "--uid #{fetch(:process_name)} #{current_path}/#{fetch(:entry_point)}"
      end
    end
  end

  desc "Stop forever process"
  task :stop do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        execute :forever, "stop", fetch(:process_name)
      end
    end
  end

  desc "Restart forever process (issues a full stop and start)"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        invoke "deploy:stop"
        invoke "deploy:start"
      end
    end
  end

  desc "Tail logs of your app"
  task :logs do
    on roles(:app) do
      execute :forever, "logs", File.join(current_path, fetch(:entry_point))
    end
  end

  desc "Clean all server logs (NOTE: IF YOU ARE SHARING THIS SERVER WITH ANY OTHER FOREVER PROCESSES THEIR LOGS WILL BE CLEANED TOO)"
  task :clean_logs do
    on roles(:app) do
      execute :forever, "cleanlogs"
    end
  end
end

namespace :load do
  task :defaults do
    set :process_name, fetch(:app_name)
    set :entry_point, "app.js"
    set :command, "node"
  end
end
