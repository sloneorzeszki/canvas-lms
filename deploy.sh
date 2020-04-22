mkdir -p log tmp/pids public/assets app/stylesheets/brandable_css_brands
touch app/stylesheets/_brandable_variables_defaults_autogenerated.scss
touch Gemfile.lock
touch log/production.log
chown -R $(whoami) config/environment.rb log tmp public/assets \
                              app/stylesheets/_brandable_variables_defaults_autogenerated.scss \
                              app/stylesheets/brandable_css_brands Gemfile.lock config.ru

yarn install
RAILS_ENV=production bundle exec rake canvas:compile_assets
sudo chown -R $(whoami) public/dist/brandable_css
