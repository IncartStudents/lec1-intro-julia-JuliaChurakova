
module GameOfLife
using Plots

mutable struct Life
    current_frame::Matrix{Int} #текущее поколение клеток 
    next_frame::Matrix{Int} #след. поеоление клеток 
end
#=
    Любая живая ячейка с двумя или тремя живыми соседями живет в следующем поколении
    Любая мертвая клетка с ровно тремя живыми соседями становится живой клеткой
    Любая живая ячейка с менее чем двумя живыми соседями умирает
    Любая живая ячейка с более чем тремя живыми соседями умирает
    
=#


function step!(state::Life)
    curr = state.current_frame
    next = state.next_frame
    n, m = size(curr)
    for i in 1:n, j in 1:m
        live = 0
        for interior_i in -1:1, interior_j in -1:1
            if interior_i == 0 && interior_j == 0 
                continue
            end
            live += curr[mod1(i + interior_i, n), mod1(j + interior_j, m)]
        end
        
        next[i,j] = (curr[i,j] == 1) ? (live in (2,3) ? 1 : 0) : (live == 3 ? 1 : 0)
    end
    
    state.current_frame, state.next_frame = state.next_frame, state.current_frame
end

function (@main)(ARGS)
    n = 30
    m = 30
    init = rand(0:1, n, m)

    game = Life(init, zeros(n, m))
    anim = @animate for time = 1:100
        step!(game)
        cr = game.current_frame
        heatmap(cr)
    end
    gif(anim, "life.gif", fps = 10)
end

export main

end

using .GameOfLife
GameOfLife.main("")
