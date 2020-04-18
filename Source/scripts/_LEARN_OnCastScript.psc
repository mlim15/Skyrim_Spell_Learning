scriptName _LEARN_OnCastScript extends ReferenceAlias

;-- Properties --------------------------------------
Spell property PracticeSpell auto

;-- Variables ---------------------------------------
Bool modDisabled = false

;-- Functions ---------------------------------------

function OnInit()
    ; Debug.Notification("LEARN Oncastscript init")
    Actor learningme = Self.GetActorReference()
    if (learningme)
        learningme.addspell(PracticeSpell, true)
    endif
endFunction

event OnPlayerLoadGame()
    _LEARN_ControlScript cs = self.GetOwningQuest() as _LEARN_ControlScript
    Debug.Trace("[Spell Learning] ======== Initializing Spell Learning (Please ignore any warning(s)/error(s) below) ========")
    cs.CanUseLocalizationLib = (PapyrusUtil.GetScriptVersion() as Int) >= 34;
    if !cs.CanUseLocalizationLib
        Debug.Trace("[Spell Learning] You need to install PapyrusUtil version >= 3.4 for localization support. Localization support disabled.")
    else
        Debug.Trace("[Spell Learning] Localization support enabled.")
    endIf
    Debug.Trace("[Spell Learning] ======== Spell Learning Initialized ========")
    cs.InternalPrepare()
endEvent