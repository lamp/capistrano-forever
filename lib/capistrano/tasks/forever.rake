namespace :forever do
  desc "Start APP"
  task :start do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        execute :forever, "start", "#{current_path}/app.js"
      end
    end
  end

  desc "Stop APP"
  task :stop do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        execute :forever, "stop", "#{current_path}/app.js"
      end
    end
  end

  desc "Restart APP"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Forever seems to not actually reload the files when restarting
      # causing production to be pointing at the old files
      # until manually stopped
      within release_path do
        invoke "deploy:stop"
        invoke "deploy:start"
      end
    end
end