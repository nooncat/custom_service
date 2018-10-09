namespace :runit do
  namespace :puma do
    desc 'Restart puma'
    task :restart do
      on roles(:app) do
        execute "sv restart customs_service"
      end
    end

    desc 'Restart puma'
    task :start do
      on roles(:app) do
        execute "sv start customs_service"
      end
    end

    desc 'Restart puma'
    task :stop do
      on roles(:app) do
        execute "sv stop customs_service"
      end
    end

    desc 'Restart puma'
    task :status do
      on roles(:app) do
        execute "sv status customs_service"
      end
    end
  end
end
