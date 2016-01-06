--使用闭合函数实现系统的pairs
local _table={"a","b","c","d"}
function DieDaiQi(t)
	local i = 0
	return function()
	      i=i+1
		return t[i]
	end
end
--迭代器
local itor = DieDaiQi(_table)
while true do      --while是个死循环
	local value = itor()
	if(value==nil) then
		break
	end
	print(value)
end

for value in DieDaiQi(_table) do
	print(value)
end

function die1t(t)
	local i = 0
	return function ()
		i=i+1
		if i>#t then
			return nil
		end
		return i,t[i]
	end
end

for key,value in die1t(_table) do
	print(key,value)
end

function test()
	local x = 1
	if x==1 then
	error("error")
    end
    print("1")
end

if pcall(test) then
	print("no error")
else
	print("函数出错了，我正在处理")
end

local status,err=pcall(test)
if status then
	print("正常")
else
	print(err)
end

local co=coroutine.create(function ()
	print("hello coroutine")
end)
coroutine.resume(co)

local co=coroutine.create(function (  )
	for i-=1,2,1 do
		print("你好")
		coroutine.yield()
	end
end)
coroutine.resume(co)
print(coroutine.status(co))

















