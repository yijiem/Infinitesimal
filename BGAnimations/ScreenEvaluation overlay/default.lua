local t = Def.ActorFrame {

    LoadActor(THEME:GetPathG("","EvalElements/GridLines"))..{
        InitCommand=function(self)
            self:diffusealpha(0)
            :zoomx(0)
            :zoomy(0.1)
            :xy(SCREEN_CENTER_X,SCREEN_CENTER_Y)
            end;
        OnCommand=function(self)
            self:sleep(1.25)
            :diffusealpha(0.25)
            :decelerate(0.5)
            :zoomx(0.15)
            end;
    };

    LoadActor(THEME:GetPathG("","EvalElements/CenterColumn"))..{
        InitCommand=function(self)
            self:diffusealpha(0)
            :zoomy(0)
            :zoomx(0.1)
            :xy(SCREEN_CENTER_X,SCREEN_CENTER_Y)
            end;
        OnCommand=function(self)
            self:sleep(1)
            :diffusealpha(1)
            :decelerate(0.3)
            :zoomy(0.1)
            end;
    };

    LoadActor(THEME:GetPathG("","ScreenHudTop"))..{
        InitCommand=function(self)
            self:diffusealpha(0)
            :vertalign(top)
            :xy(SCREEN_CENTER_X,SCREEN_TOP-100)
            :diffusealpha(1)
            :zoom(0.2135,0.2135)
            :sleep(0.25)
            :decelerate(0.75)
            :y(SCREEN_TOP)
        end;
    };

    LoadActor(THEME:GetPathG("","ScreenHudBottom"))..{
        InitCommand=function(self)
            self:diffusealpha(0)
            :vertalign(bottom)
            :xy(SCREEN_CENTER_X,SCREEN_BOTTOM+100)
            :diffusealpha(1)
            :zoom(0.2135,0.2135)
            :sleep(0.25)
            :decelerate(0.75)
            :y(SCREEN_BOTTOM)
        end;
    };

    --- ------------------------------------------------
    --- Text/Song Info
    --- ------------------------------------------------

    LoadFont("montserrat semibold/_montserrat semibold 40px")..{
        InitCommand=function(self)
            local song = GAMESTATE:GetCurrentSong();
            self:diffusealpha(0)
            self:sleep(1.75)
            self:horizalign(center);
            self:diffuse(0,0,0,1);
            self:settext(song:GetDisplayMainTitle());
            self:maxwidth(700);
            if song:GetDisplaySubTitle() ~= "" then
                self:xy(SCREEN_CENTER_X,68):zoom(0.35);
            else
                self:xy(SCREEN_CENTER_X,75):zoom(0.35);
            end;
            self:decelerate(0.25):diffusealpha(1);
        end;
    };

    LoadFont("montserrat/_montserrat 40px")..{
        InitCommand=function(self)
            local song = GAMESTATE:GetCurrentSong();
            self:diffusealpha(0)
            self:sleep(1.75)
            self:horizalign(center);
            self:diffuse(0,0,0,1);
            self:maxwidth(700);
            self:xy(SCREEN_CENTER_X,84):zoom(0.35);
            if song:GetDisplaySubTitle() then
                self:settext(song:GetDisplaySubTitle());
            else
                self:settext("");
            end;
            self:decelerate(0.25):diffusealpha(1);
        end;
    };
};

--- ------------------------------------------------
--- Judgement counts, etc
--- ------------------------------------------------

for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
    t[#t+1] = LoadActor("PlayerNumbers", pn)..{
        InitCommand=function(self)
            self:xy(SCREEN_CENTER_X,136)
            end;
    };

end;

return t;