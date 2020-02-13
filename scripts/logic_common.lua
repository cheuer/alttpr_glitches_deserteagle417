function canActivateTablets()
    if Tracker:ProviderCountForCode("swordless") > 0 then
        return Tracker:ProviderCountForCode("hammer")
    else
        return Tracker:ProviderCountForCode("sword2")
    end
end

function canUseMedallions()
    if Tracker:ProviderCountForCode("swordless") > 0 then
        return 1
    else
        return Tracker:ProviderCountForCode("sword")
    end
end

function canRemoveCurtains()
    if Tracker:ProviderCountForCode("swordless") > 0 then
        return 1
    else
        return Tracker:ProviderCountForCode("sword")
    end
end

function canClearAgaTowerBarrier()
    -- With cape, we can always get through
    if Tracker:ProviderCountForCode("cape") > 0 then
        return 1
    end
    -- Otherwise we need master sword or a hammer depending on the mode
    if Tracker:ProviderCountForCode("swordless") > 0 then
        return Tracker:ProviderCountForCode("hammer")
    else
        return Tracker:ProviderCountForCode("sword2")
    end    
end

function gtCrystalCount()
    local reqCount = Tracker:ProviderCountForCode("gt_crystals")
    local count = Tracker:ProviderCountForCode("crystal")

    if count >= reqCount then
        return 1
    else
        return 0
    end
end

function ganonCrystalCount()
    local reqCount = Tracker:ProviderCountForCode("ganon_crystals")
    local count = Tracker:ProviderCountForCode("crystal")

    if count >= reqCount then
        return 1
    else
        return 0
    end
end

function has(item, amount)
    local count = Tracker:ProviderCountForCode(item)
    amount = tonumber(amount)
    if not amount then
      return count > 0
    else
      return count == amount
    end
end

function lowerTurtleRock()
    if canMirrorWrap()
    and ( has("pearl") or canOWYBA() )
    and ( has("boots") or canOneFrameClipOW() )
    then
        if Tracker:ProviderCountForCode("mg") > 0 then
            return 1
        else
            return 1, AccessibilityLevel.SequenceBreak
        end
    end

    return 0
end

function middleTurtleRock()
    if has("mirror") --mirror clip
    or ((has("sword") or has("hookshot"))
    and has("pearl")
    and has("boots")) --superspeed clip
    then
        return 1
    else 
        if has("boots") and canOWYBA() or canOneFrameClipOW() then
            if Tracker:ProviderCountForCode("mg") > 0 then
                return 1
            else
                return 1, AccessibilityLevel.SequenceBreak
            end
        else
            
        end
    end

    return 0
end

function upperTurtleRock()
    if not canOpenTurtleRock() then return 0 end

    if has("boots") -- boots clip
        or (has("lift2") and has("hammer")) -- normal
    then
        return 1
    end

    if (has("pearl") or (canOWYBA() and (has("boots") or canOneFrameClipOW())))
    and ((has("lift2") and has("hammer")) or has("boots") or canOneFrameClipOW() )
    then
        if Tracker:ProviderCountForCode("mg") > 0 then
            return 1
        else
            return 1, AccessibilityLevel.SequenceBreak
        end
    end

    return 0
end

function canOpenTurtleRock()
    return has("somaria")
        and has("pearl")
        and (has("tr_medallion") or (has("bombos") and has("ether") and has("quake")))
        and has("$canUseMedallions")
end

function canOWYBA()
    if has("bottle") then
        if Tracker:ProviderCountForCode("mg") > 0 then
            return 1
        else
            return 1, AccessibilityLevel.SequenceBreak
        end
    else
        return 0
    end
end

function canOneFrameClipOW()
    if Tracker:ProviderCountForCode("mg") > 0 then
        return 1
    else
        return 1, AccessibilityLevel.SequenceBreak
    end
end

function canOneFrameClipUW()
    if Tracker:ProviderCountForCode("mg") > 0 then
        return 1
    else
        return 0
    end
end

function canMirrorWrap()
    if has("mirror") then
        if Tracker:ProviderCountForCode("mg") > 0 then
            return 1
        else
            return 1, AccessibilityLevel.SequenceBreak
        end
    else
        return 0
    end
end
