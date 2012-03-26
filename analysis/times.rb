def time_diff_minutes(start_time, end_time)
    (end_time - start_time)/60
end

def total_time_minutes(username)
    user = User.find_by_username(username)
    responses = user.responses
    if responses.length > 0
        time_diff_minutes(responses[0].created_at, responses[-1].created_at)
    else
        0
    end
end

def time_array(username)
    user = User.find_by_username(username)
    responses = user.responses
    if responses.length > 1
        responses[0..-2].zip(responses[1..-1]).collect do |pair|
            time_diff_minutes(pair[0].created_at, pair[1].created_at)
        end
    else
        []
    end
end

def avg_time(username)
    times = time_array(username)
    times.sum / times.length
end
