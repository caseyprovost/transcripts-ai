// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import { Turbo } from "@hotwired/turbo-rails"
import "controllers"

// Make accessible for Electron and Mobile adapters
// window.Rails = Rails
window.Turbo = Turbo