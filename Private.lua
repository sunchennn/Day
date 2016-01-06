--第一次修改上传的lua文件
-- function createSprite(  )
-- 	local Young={name="myname"}

-- 	local function MyBus()
-- 		print("myBus 是我自己的函数，你不能随便调用")
-- 	end

-- 	local function MyGame()
-- 		print("MyGame 是我自己的函数，你不能随便调用")
-- 	end

-- 	local function hello()
-- 		print("hello ")
-- 		MyBus()
-- 	end

-- 	local function hi(  )
-- 		print("hi")
-- 		MyGame()
-- 	end

-- 	local function setName( newname )
--        Young.name=newname
-- 	end

-- 	local function getName(  )
-- 		return Young.name
-- 	end

-- 	-- 对外开放的函数
-- 	return {hello=hello,hi=hi,setName=setName,getName=getName}
-- end

-- local sp=createSprite()
-- sp:setName("realy")
-- print(sp:getName())
-- sp.hello()
-- sp.hi()

--	多继承
function seatch( classess,key )
	for i=1,#classess do
		local value=classess[i][key]
		if value~=nil then
          return value
      end
  end
end

local t1={game1="game111"}
local t2 = {game2="game333"}
print(seatch({t1,t2},"game1"))

function createClass( ... )
	local parents={...}
	local child={}
	setmetatable(child,{
		__index=function ( table,key )
			return seatch(parents,key)
		end
		})

	function child:new()
		o={}
		setmetatable(o,child)
		child.__index=child
		return  o
		end
		return child
end

TSprite={}
function TSprite:hello(  )
	print("Ts")
end

function TSprite:new( o )
	o={}
	setmetatable(o,self)
	self.__index=self
	return o
end

TBullet={}
function TBullet:fire(  )
	print("Tb")
end

function TBullet:new(  )
	o={}
	setmetatable(o,self)
	self.__index=self
	return o
end 

TCreate={}
function TCreate:doit(  )
	print("Tc")
end
function TCreate:new( )
	o={}
	setmetatable(o,self)
	self.__index=self
	return o
end

local bulletSprite=createClass(TSprite,TBullet,TCreate)
local bSprite=bulletSprite:new()
bSprite:hello()
bSprite:fire()
bSprite:doit()

























