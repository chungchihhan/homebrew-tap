cask "fetch-snippets" do
  version "1.4.0"
  sha256 "98be98fb97da7a83b56c86e916b5e06d535728e4a73a7788d25398c90ef5d44b"

  url "https://github.com/chungchihhan/fetch/releases/download/v#{version}/Fetch.zip"
  name "Fetch"
  desc "Snippet manager for the menu bar"
  homepage "https://github.com/chungchihhan/fetch"

  auto_updates true
  depends_on macos: :sonoma

  app "Fetch.app"
end
