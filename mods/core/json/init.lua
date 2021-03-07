-- load table from json file
function json_2_table(path_to_file)
    local f,err = io.open(path_to_file, "r") -- open file for reading
    if err then
        error(err)
        return nil
    end
    local t = minetest.parse_json(f:read("*all")) -- parse file to lua table
    f:close() -- close file
    return t
end
