require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  queue = []
  result = []

  vertices.each do |vertex|
    if vertex.in_edges.empty?
      queue.push(vertex)
    end
  end

  until queue.empty?
    vertex = queue.shift
    result << vertex

    vertex.out_edges.reverse.each do |edge|
      if edge.to_vertex.in_edges.length == 1
        queue.push(edge.to_vertex)
      end
      edge.destroy!
    end
  end

  if vertices.length == result.length
    return result
  else
    return []
  end
end
