def time_diff_minutes(start_time, end_time)
    (end_time - start_time)/60
end

def total_time_minutes(user)
    responses = user.responses
    if responses.length > 0
        time_diff_minutes(responses[0].created_at, responses[-1].created_at)
    else
        0
    end
end

def time_array(user)
    responses = user.responses
    if responses.length > 1
        responses[0..-2].zip(responses[1..-1]).collect do |pair|
            time_diff_minutes(pair[0].created_at, pair[1].created_at)
        end
    else
        []
    end
end

def avg_time_per_question(user)
    times = time_array(user)
    times.sum / times.length
end

def avg_times_per_question()
    User.find_all_by_admin(false).collect {|u| avg_time(u)}
end

def avg_total_time_minutes()
    User.find_all_by_admin(false).collect {|u| total_time_minutes(u)}
end

def avg(lst)
    lst.sum / lst.length
end
