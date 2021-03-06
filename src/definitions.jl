macro hierarchical_dict()
    return esc(
               quote
                   @nospecialize
                   import HierarchicalUtils: NodeType, InnerNode, noderepr, children
                   NodeType(::Type{<:Dict}) = InnerNode()
                   children(d::Dict) = d
                   noderepr(d::Dict) = isempty(d) ? "Empty Dict" : "Dict of"
                   @specialize
                   nothing
               end
              )
end

macro hierarchical_vector()
    return esc(
               quote
                   @nospecialize
                   import HierarchicalUtils: NodeType, InnerNode, noderepr, children
                   NodeType(::Type{<:Vector}) = InnerNode()
                   children(v::Vector) = v
                   noderepr(v::Vector) = isempty(v) ? "[]" : "Vector of"
                   @specialize
                   nothing
               end
              )
end

macro hierarchical_tuple()
    return esc(
               quote
                   @nospecialize
                   import HierarchicalUtils: NodeType, InnerNode, noderepr, children
                   NodeType(::Type{<:Tuple}) = InnerNode()
                   children(v::Tuple) = v
                   noderepr(v::Tuple) = isempty(v) ? "()" : "Tuple of"
                   @specialize
                   nothing
               end
              )
end

macro hierarchical_namedtuple()
    return esc(
               quote
                   @nospecialize
                   import HierarchicalUtils: NodeType, InnerNode, noderepr, children
                   NodeType(::Type{<:NamedTuple}) = InnerNode()
                   children(v::NamedTuple) = v
                   noderepr(v::NamedTuple) = isempty(v) ? "()" : "NamedTuple of"
                   @specialize
                   nothing
               end
              )
end

macro hierarchical_pairvector()
    return esc(
               quote
                   @nospecialize
                   import HierarchicalUtils: NodeType, InnerNode, noderepr, children
                   NodeType(::Type{<:HierarchicalUtils.PairVec}) = InnerNode()
                   children(v::HierarchicalUtils.PairVec) = v
                   noderepr(v::HierarchicalUtils.PairVec) = isempty(v) ? "Empty Vector" : "Vector of pairs of"
                   @specialize
                   nothing
               end
              )
end

macro primitives()
    return esc(
               quote
                   @nospecialize
                   import HierarchicalUtils: NodeType, LeafNode
                   NodeType(::Type{<:Number}) = LeafNode()
                   NodeType(::Type{<:AbstractString}) = LeafNode()
                   NodeType(::Type{<:AbstractChar}) = LeafNode()
                   NodeType(::Type{Symbol}) = LeafNode()
                   NodeType(::Type{Missing}) = LeafNode()
                   NodeType(::Type{Nothing}) = LeafNode()
                   @specialize
                   nothing
               end
              )
end
