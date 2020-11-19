#!/usr/bin/env ruby

require "active_fedora"
require "hydra/pcdm"

class Ob < Hydra::PCDM::Object
  property :title, predicate: "http://example.org/title"
end

work1 = Ob.new(id: 'wk1', title: ['Work 1'])
work2 = Ob.new(id: 'wk2', title: ['Child Work 1'])
work3 = Ob.new(id: 'wk3', title: ['Child Work 2'])
work4 = Ob.new(id: 'wk4', title: ['Parent Work 1'])
fileset1 = Ob.new(id: 'fs1', title: ['Child File Set 1'])
fileset2 = Ob.new(id: 'fs2', title: ['Child File Set 2'])
work4.ordered_members << work1
work1.ordered_members = [work2, work3, fileset1, fileset2]
puts work1.members.map(&:id).inspect
puts work1.ordered_members.to_a.map(&:id).inspect
