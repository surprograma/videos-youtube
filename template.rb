#!/usr/bin/env ruby

require 'erb'
require 'thor'
require 'yaml'
require 'liquid'

TEMPLATE = 'template.txt.liquid'

class Patrona < Thor
  include Thor::Actions

  def self.exit_on_failure?
    true
  end

  desc 'descripcion DATA', 'genera la descripción del video'
  def descripcion(data)
    template = Liquid::Template.parse File.read(TEMPLATE)
    info = YAML.load_file data

    say template.render(info)
  end
end

Patrona.start(ARGV)
