--test Folder
    f=io.open("C:/Program Files (x86)/GLaDOS_Alpha_3/GLaDOS_Folder/userID","r")
    if f ~= nil then
        f:close()
    else
        f=io.open("C:/Program Files (x86)/GLaDOS_Alpha_3/GLaDOS_Folder/userID","w")
        f:write("0")
        f:close()
    end

--Variable
t={}
--Function
	function os.sleep(waitTime)
    	timer = os.time()
        repeat until os.time() > timer + waitTime
	end

	function os.clear()
	    os.execute("cls")
	end

	function Glados()
    	print("       __________  ___       __________ __________  _________  _________")
    	print("      /  _______/ /  /      /  ____   //  _____  / / _____  / / _______/")
    	print("     /  /        /  /      /  /   /  //  /    / / / /    / / / /")
    	print("    /  /        /  /      /  /   /  //  /    / / / /    / / / /______")
    	print("   /  / ______ /  /      /  /___/  //  /    / / / /    / / /______  /")
    	print("  /  / /__   //  /      /  ____   //  /    / / / /    / /        / /")
    	print(" /  /____/  //  /_____ /  /   /  //  /____/ / / /____/ / _______/ /")
    	print("/__________//________//__/   /__//_________/ /________/ /________/")
        print("")
	end

    function create_user()
        f=io.open("C:/Program Files (x86)/GLaDOS_Alpha_3/GLaDOS_Folder/userID","r")
            a=f:read()
        f:close()
        io.write("User: ")
        user=io.read()
        f=io.open("C:/Program Files (x86)/GLaDOS_Alpha_3/GLaDOS_Folder/"..user.."_"..a,"w")
            io.write("User Pass Word: ")
            PW=io.read()
            f:write(user.." "..PW)
        f:close()
        f=io.open("C:/Program Files (x86)/GLaDOS_Alpha_3/GLaDOS_Folder/userID","w")
            f:write(a+1)
        f:close()
        if u==true then
            User()
        end     
    end

    function User()
        while true do
        io.write("User name: ")
        user=io.read()
        io.write("User Pass Word: ")
        PW=io.read()
        temp=0
        while true do
            f=io.open("C:/Program Files (x86)/GLaDOS_Alpha_3/GLaDOS_Folder/"..user.."_"..temp,"r")
            if f ~= nil then
                scontent=f:read()
                f:close()
                break
            else
                temp=temp+1
            end
        end
        scontent:gsub("%S+",function(c) table.insert(t,c) end)
        if PW == t[2] then
            os.clear()
            print("Welcome "..user.." to GLaDOS V:Alpha3")
            Glados()
            break
        else
            print("Error")
        end
        end
    end

    function new(v)
        file=io.open(v,"w")
        file:close()
    end

    function edit(v)
        file=io.open(v,"w")
            file:write(io.read())
        file:close()
    end

    function execute(v)
        file=io.open(v)
            b=file:read()
        file:close()
        file=io.open("ram.lua","w")
            file:write(b)
        file:close()
        os.execute("ram.lua")
        os.remove("ram.lua")
    end

    function remove(v)
        os.remove(v)
    end

    function min_user()
        supuser=io.read()
        temp=0
        while true do
            f=io.open("C:/Program Files (x86)/GLaDOS_Alpha_3/GLaDOS_Folder/"..supuser.."_"..temp,"r")
            if f ~= nil then
                f:close()
                os.remove("C:/Program Files (x86)/GLaDOS_Alpha_3/GLaDOS_Folder/"..supuser.."_"..temp)
                f=io.open("C:/Program Files (x86)/GLaDOS_Alpha_3/GLaDOS_Folder/userID","r")
                    a=f:read()
                f:close()
                f=io.open("C:/Program Files (x86)/GLaDOS_Alpha_3/GLaDOS_Folder/userID","w")
                    f:write(a-1)
                f:close()
                break
            else
                temp=temp+1
            end 
        end
    end

--GLaDOS
while true do
        u=true
        os.clear()
        Glados()
        f=io.open("C:/Program Files (x86)/GLaDOS_Alpha_3/GLaDOS_Folder/userID","r")
            z=f:read()
        f:close()
        if z == "0" then
            print("Creating user")
            create_user()
        else
            User()
        end
    while true do
        x=io.read()
        if x == "add user" then
            u=false
            create_user()
        elseif x == "clear" then
            os.clear()
            print("Welcome "..user.." to GLaDOS V:Alpha3")
            Glados()
        elseif x == "reboot" then
            break
        elseif x == "exit" then
            e=false
            break
        elseif x == "new" then
            v=io.read()
            new(v)
        elseif x == "edit" then
            v=io.read()
            edit(v)
        elseif x == "execute" then
            v=io.read()
            execute(v)
        elseif x == "rm" then
            v=io.read()
            remove(v)
        elseif x == "remove user" then
            min_user()
        else
            print("SYNTAX ERROR")
        end
    end
    if e == false then
        break
    end
end