# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require 'graph'
require 'topological_sort'


def install_order(arr)
  ids = arr.flatten
  max = ids.max
  vertices = []

  (1..max).each do |id|
    vertices << Vertex.new(id)
  end

  edges = []

  arr.each do |id, dependency|
    edges << Edge.new(vertices[dependency - 1], vertices[id - 1])
  end

  sorted_array = topological_sort(vertices)

  sorted_array.map(&:value)
end
