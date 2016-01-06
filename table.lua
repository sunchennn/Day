-- t={}


-- mt={}
-- setmetatable(t,mt)        --设置元表
-- print(getmetatable(t))

-- t1={"a"}
-- t2={"b"}
-- m={}
-- m.__add=function()
-- 	print("我是_aa函数")
-- end
-- setmetatable(t1,m)
-- setmetatable(t2,m)

-- local t3 = t1+t2

-- -- m={
-- -- 	__add=function()
-- -- 		print("另一种写法")
-- -- 	end
-- -- }
-- --如果两个表具有不同的元素  -ok
-- --如果两个表具有不同的元素
-- -- （1）A有元表，B有元表     -->A元表计算
-- -- （2）A有元表，B没有元表   -->A元素计算
-- --  (3) A没有元表，B有元表  -->B元素计算
-- -- （4）A没有元表，B没有元表   -->程序崩溃

-- --index
-- local t={name="zhang",age=22,marry=false}
-- local mt = {}
-- mt.__index=function( t,k )
-- 	print(k .. "根本不存在")
-- end
-- setmetatable(t,mt)
-- print(t.name)
-- print(t.money)

-- local t={name="hehe"}
-- local mt={
-- 	__index={money=7900}
-- }
-- setmetatable(t,mt)
-- print(t.name)
-- print(t.money)

-- local smartMan={
-- 	name="realy",
-- 	money=16222,
-- 	sayHello=function ()
-- 		print("sayHello")
-- 	end
-- }

-- local t1={}
-- local t2={}
-- local mt={
-- 	__index=smartMan
-- }
-- setmetatable(t1,mt)
-- setmetatable(t1,mt)
-- print(t1.money)
-- print(t1.sayHello) 


--index:用于查询 __newindex:用于监听
-- local t={name="aa",money=2424}
-- local mt={
-- 	__index=function( t,k )
-- 		print(k .. "根本不存在")
-- 	end,
-- 	__newindex=function ( t,k,v )
-- 		print(k .. "不存在，别修改")
-- 	end
-- }
-- setmetatable(t,mt)
-- print(t.age)
-- t.age=50
-- print(t.age)


--__newindexy也可以赋予一个table值
-- local  smartMan = {name="none"}
-- local other={name="大家好，我是很无辜的小朱朱"}
-- local t1={}
-- local mt={
-- 	__index=smartMan,
-- 	__newindex=other
-- }
-- setmetatable(t1,mt)
-- print("other的名字,f赋值前".. other.name)
-- t1.name="小偷"
-- print("other的名字，赋值后:".. other.name)
-- print("t1的名字".. t1.name)

-- local smartMan={
-- 	name="none"
-- }
-- local t1={
-- 	hehe=123
-- }
-- local mt={
-- 	__index=smartMan,
-- 	__newindex=function( t,k,v )
-- 		print("别赋值")
-- 	end
-- }

-- setmetatable(t1,mt)
-- print(rawget(t1,"name"))
-- print(rawget(t1,"hehe"))
-- rawset(t1,"name","小偷")
-- print(t1.name)



--一个简单的模板
-- game=require("game")
-- game.play()
-- game.quit()

-- sprite=require("game")
-- sprite.setPosition(sprite,10,40)
-- sprite.show(sprite)
-- sprite:move()
-- sprite.show(sprite)

-- person=require("Person")
-- person:setPerson("小朱朱",20,"男")
-- person:show()
-- name=person:getName()
-- age=person:getAge()
-- sex=person:getSex()
-- print(name,age,sex)
-- person:show()

-- local mt={}
-- mt.__add=function ( t1,t2 )
-- 	print("两个数相加")
-- end
-- local t1={}
-- local t2 = {}
-- setmetatable(t1,mt)
-- setmetatable(t1,mt)
-- local result=t1+t2
-- print(result)

-- local mt={}
-- mt.__add=function ( s1,s2 )
-- 	local result = " "
-- 	if s1.sex=="boy" and s2.sex=="girl" then
-- 		result="完美家庭"
-- 		elseif s1.sex=="girl" and s2.sex=="girl" then
-- 			result="不好"
-- 		else
-- 			result="不好"
-- 		end
-- 		return result
-- end

-- local s1={
-- 	name="hello",
-- 	sex="boy"
-- }

-- local s2={
-- 	name="Good",
--     sex="girl"
-- }

-- setmetatable(s1,mt)
-- setmetatable(s2,mt)
-- local result=s1+s2
-- print(result)

-- local t={
-- 	name="hehe"
-- }
-- print(t.money)
-- local mt={
-- 	__index=function ( table,key )
-- 		print("虽然你调用了我不存在的字段，不过没关系，我能探测过来" .. key)
-- 	end
-- }
-- setmetatable(t,mt)
-- print(t.money)

-- local smartMan={
-- 	name="none",
-- 	age=24,
-- 	money=125,
-- 	sayHello=function ( )
-- 		print("大家好，我是聪明的小朱朱")
-- 	end
-- }

-- local t1={}
-- local  t2 ={}
-- local  mt= {__index=smartMan}
-- setmetatable(t1,mt)
-- setmetatable(t2,mt)
-- print(t1.money)
-- t2.sayHello()


local smartMan={
	name="none",
	money=434,
	sayHello=function (  )
		print("大家")
	end
}
-- local t1={sayHello=function ( )
-- 	print("大家two")
-- end}
local t1={}
local mt = {
	__index=smartMan,
	__newindex=function ( table,key,value )
		print(key .. "字段是不存在的不要试图肤质")
	end
}

setmetatable(t1,mt)
t1.sayHello=function (  )
	print("no")
end
t1.sayHello()





















































