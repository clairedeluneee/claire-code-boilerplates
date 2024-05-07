function ccText(tag, text, size, x, y, camera, bord, align)
	local tagg = ''..tag
	local cam = camera or 'other'
	local bo  = bord or 1
	local al = align or 'left'
	makeLuaText(tag, text, 0, x, y)
	setProperty(tag..'.size', size)
	setObjectCamera(tag, cam)
	setProperty(tag..'.borderSize', bo)
	setTextAlignment(tag, 'left')
	addLuaText(tag)
end -- Easier text creation
function ccRect(tag, x, y, wide, tall, color, camera, isTopLeftOrigin)
	makeLuaSprite(tag, '', x, y)
	makeGraphic(tag, wide, tall, color)
	setObjectCamera(tag, camera)
	setObjectOrder(tag, 350)
	addLuaSprite(tag, false)
	local TLOrigin = isTopLeftOrigin or false
	
	if TLOrigin then
	setProperty(tag..'.origin.x', 0)
	setProperty(tag..'.origin.y', 0)
	end

end -- Easier rectangle creation
function hexify(rgb, g, b)
	local hexed = ''
	if g == nil then
	hexed = string.format('%x', (rgb[1] * 0x10000) + (rgb[2] * 0x100) + rgb[3])
	else
	hexed = string.format('%x', (rgb * 0x10000) + (g * 0x100) + b)
	end
	--debugPrint(hexed)
	return hexed
end -- Conversion of RGB to hex codes
function ccInterp(elapsed, valueToInterpolate, valueToInterpTo, timescale, upperBound, lowerBound)
	local scaleOne	= valueToInterpolate
	local interpFramerate = 240
	local interpTimescale = timescale or 1
	local deltaTime = elapsed / ((1/interpFramerate) * interpTimescale)
	local valueTwee	= valueToInterpTo
	local differenc = valueTwee - (scaleOne)
	local maxDiff 	= upperBound	or  math.huge
	local minDiff	= lowwerBound	or -math.huge
	if differenc > maxDiff then differenc = maxDiff end
	if differenc < minDiff then differenc = minDiff end
	local tween		= scaleOne + (differenc / 50 * deltaTime)
	local interpolatedValue = tween
	return interpolatedValue
end -- Cubic (sort-of?) interpolator
function accuracyToRatingString(accuracy, system, adjusted)
    local deez = accuracy * 100
    local aaccuracy = deez
    
    if system == 'andro' and adjusted == false then
        if deez == 100 then
            return '☆☆☆☆☆'
        elseif deez >= 99 then
            return '☆☆☆☆'
        elseif deez >= 98 then
            return '☆☆☆'
        elseif deez >= 97 then
            return '☆☆'
        elseif deez >= 96 then
            return '☆'
        elseif deez >= 94 then
            return 'S+'
        elseif deez >= 92 then
            return 'S'
        elseif deez >= 89 then
            return 'S-'
        elseif deez >= 86 then
            return 'A+'
        elseif deez >= 83 then
            return 'A'
        elseif deez >= 80 then
            return 'A-'
        elseif deez >= 76 then
            return 'B+'
        elseif deez >= 72 then
            return 'B'
        elseif deez >= 68 then
            return 'B-'
        elseif deez >= 64 then
            return 'C+'
        elseif deez >= 60 then
            return 'C'
        elseif deez >= 55 then
            return 'C-'
        elseif deez >= 50 then
            return 'D+'
        else
            return 'D'
        end
    end -- Original Andromeda Engine rating system
    
    if system == 'andro' and adjusted == true then
        if deez == 100 then
            return 'U'
        elseif deez >= 99.9 then
            return 'SSS'
        elseif deez >= 99.5 then
            return 'SS+'
        elseif deez >= 99.25 then
            return 'SS'
        elseif deez >= 99 then
            return 'SS-'
        elseif deez >= 97.5 then
            return 'S+'
        elseif deez >= 96 then
            return 'S'
        elseif deez >= 95 then
            return 'S-'
        elseif deez >= 94.75 then
            return 'A+'
        elseif deez >= 92.5 then
            return 'A'
        elseif deez >= 90 then
            return 'A-'
        elseif deez >= 87 then
            return 'B+'
        elseif deez >= 85 then
            return 'B'
        elseif deez >= 82.25 then
            return 'B-'
        elseif deez >= 80 then
            return 'C+'
        elseif deez >= 75 then
            return 'C'
        elseif deez >= 70 then
            return 'C-'
        elseif deez >= 65 then
            return 'D+'
        else
            return 'D'
        end
    end -- Normalized Andromeda Engine rating system
    
    if system == 'kade' then
        if aaccuracy >= 99.9935 then
            return 'AAAAA'
        elseif aaccuracy >= 99.980 then
            return 'AAAA:'
        elseif aaccuracy >= 99.970 then
            return 'AAAA.'
        elseif aaccuracy >= 99.955 then
            return 'AAAA'
        elseif aaccuracy >= 99.90 then
            return 'AAA:'
        elseif aaccuracy >= 99.80 then
            return 'AAA.'
        elseif aaccuracy >= 99.70 then
            return 'AAA'
        elseif aaccuracy >= 99 then
            return 'AA:'
        elseif aaccuracy >= 96.50 then
            return 'AA.'
        elseif aaccuracy >= 93 then
            return 'AA'
        elseif aaccuracy >= 90 then
            return 'A:'
        elseif aaccuracy >= 85 then
            return 'A.'
        elseif aaccuracy >= 80 then
            return 'A'
        elseif aaccuracy >= 70 then
            return 'B'
        elseif aaccuracy >= 60 then
            return 'C'
        else
            return 'D'
        end
    end -- Kade Engine ratings
    
    if system == 'psych-simple' then
        if deez == 100 then
            return 'Perfect!!!'
        elseif deez >= 90 then
            return 'Sick!!'
        elseif deez >= 80 then
            return 'Great!'
        elseif deez >= 70 then
            return 'Good'
        elseif deez >= 69 and deez < 70 then
            return 'Nice'
        elseif deez >= 60 then
            return 'Meh'
        elseif deez >= 50 then
            return 'Bruh'
        elseif deez >= 40 then
            return 'Bad'
        elseif deez >= 30 then
            return 'Shit'
        else
            return 'You Suck!'
        end
    end -- Simple Psych Engine ratings
end -- Converts accuracy to various ranks
function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end -- Rounding function with custom precision
function anchorTextRight(tag, x)
    setTextAlignment(tag, 'right')
    setProperty(tag..'.x', x - getProperty(tag..'.width'))
end -- Anchors text to the right of x
function formatMul(num, sep)
    local strin = ''
    local v = math.floor(num)

    if v < 1000 then
        strin = ''..v
        return strin
    elseif v < 1000000 then
        strin = ''..math.floor(v / 1000)..sep..string.format('%03d', v - (math.floor(v / 1000) * 1000))
        return strin
    end
end -- Thousands separator (might break past 1 billion)
function formatTime(ms, hasMs)
    local st = ''

    local secTemp = math.floor(ms / 1000)
    local minTemp = secTemp / 60

    local secr = secTemp - (math.floor(minTemp) * 60)
    local minr = math.floor(minTemp)

    st = minr..':'..string.format('%02d', secr)

    if hasMs then st = st..'.'..string.format('%03d', ms - (secTemp * 1000)) end
    return st
end -- Time formatter: ms to mm:ss
function setText(tag, text)
    setProperty(tag..'.text', text)
end
function forceRight(spr, x, pad)
    setProperty(spr..'.x', x - getProperty(spr..'.width') - pad)
end
function isEmpty(s)
   return s == nil or s == ''
end

-- Callback functions

-- ] Entry / Exit points
function onCreate()                 -- Called as soon as PlayState is initialized. This happens before variables like songName are declared.
    -- code
end
function onCreatePost()             -- Called after PlayState is initialized. Variables are declared here.
    -- code
end
function onDestroy()                -- Called on state exit (Going back to main menu / story mode / freeplay).
    -- code
end

-- ] Updates
function onUpdate(frameDelta)       -- Called once per frame before the usual update loop.
    -- code
end
function onUpdatePost(frameDelta)   -- Called once per frame after the usual update loop.
    -- code
end

-- ] Note interaction
function goodNoteHit(id,direction,notetype,sustain)     -- Called after the player hits any note.
    if sustain == false then

    end
end
function noteMiss(id,direction,notetype,sustain)        -- Called when the player misses a note by letting it go offscreen. Also called when a Hurt Note is hit.
    if sustain == false then

    end
end
function noteMissPress(direction)                       -- Called when the player presses a key when there are no notes to hit. Also known as ghost tapping.
    -- code
end

-- ] Events
function onEvent(id, val1, val2)
    if i = "" then

    end
end