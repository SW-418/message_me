# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment.rb', __dir__)

require 'rspec/rails'

RSpec.configure(&:infer_spec_type_from_file_location!)
