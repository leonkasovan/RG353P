package main
import (
	_ "embed" // Support for go:embed resources
	"encoding/json"
	"fmt"
	"io/ioutil"
	// "os"
	// "regexp"
	// "strings"
)

type configSettings_new struct {
	AIRamping                  bool
	AIRandomColor              bool
	AISurvivalColor            bool
	AudioDucking               bool
	AudioSampleRate            int32
	AutoGuard                  bool
	BarGuard                   bool
	BarRedLife                 bool
	BarStun                    bool
	Borderless                 bool
	ComboExtraFrameWindow      int32
	CommonAir                  []string
	CommonCmd                  []string
	CommonConst                []string
	CommonFx                   []string
	CommonLua                  []string
	CommonStates               []string
	ControllerStickSensitivity float32
	Credits                    int
	DebugClipboardRows         int
	DebugClsnDarken            bool
	DebugConsoleRows           int
	DebugFont                  string
	DebugFontScale             float32
	DebugKeys                  bool
	DebugMode                  bool
	Difficulty                 int
	EscOpensMenu               bool
	ExternalShaders            []string
	FirstRun                   bool
	FontShaderVer              uint
	ForceStageZoomin           float32
	ForceStageZoomout          float32
	Framerate                  int32
	Fullscreen                 bool
	FullscreenRefreshRate      int32
	FullscreenWidth            int32
	FullscreenHeight           int32
	GameWidth                  int32
	GameHeight                 int32
	GameFramerate              float32
	IP                         map[string]string
	LifeMul                    float32
	ListenPort                 string
	LoseSimul                  bool
	LoseTag                    bool
	MaxAfterImage              int32
	MaxBgmVolume               int
	MaxDrawGames               int32
	MaxExplod                  int
	MaxHelper                  int32
	MaxPlayerProjectile        int
	Modules                    []string
	Motif                      string
	MSAA                       bool
	NumSimul                   [2]int
	NumTag                     [2]int
	NumTurns                   [2]int
	PanningRange               float32
	Players                    int
	PngSpriteFilter            bool
	PostProcessingShader       int32
	QuickContinue              bool
	RatioAttack                [4]float32
	RatioLife                  [4]float32
	RatioRecoveryBase          float32
	RatioRecoveryBonus         float32
	RoundsNumSimul             int32
	RoundsNumSingle            int32
	RoundsNumTag               int32
	RoundTime                  int32
	ScreenshotFolder           string
	StartStage                 string
	StereoEffects              bool
	System                     string
	Team1VS2Life               float32
	TeamDuplicates             bool
	TeamLifeShare              bool
	TeamPowerShare             bool
	TrainingChar               string
	TurnsRecoveryBase          float32
	TurnsRecoveryBonus         float32
	VolumeBgm                  int
	VolumeMaster               int
	VolumeSfx                  int
	VRetrace                   int
	WavChannels                int32
	WindowCentered             bool
	WindowIcon                 []string
	WindowTitle                string
	XinputTriggerSensitivity   float32
	ZoomActive                 bool
	ZoomDelay                  bool
	ZoomSpeed                  float32
	KeyConfig                  []struct {
		Joystick int
		Buttons  []interface{}
	}
	JoystickConfig []struct {
		Joystick int
		Buttons  []interface{}
	}
}

type configSettings_old struct {
	AIRamping                  bool
	AIRandomColor              bool
	AISurvivalColor            bool
	AudioDucking               bool
	AudioSampleRate            int32
	AutoGuard                  bool
	BarGuard                   bool
	BarRedLife                 bool
	BarStun                    bool
	Borderless                 bool
	ComboExtraFrameWindow      int32
	CommonAir                  string
	CommonCmd                  string
	CommonConst                string
	CommonFx                   []string
	CommonLua                  []string
	CommonStates               []string
	ControllerStickSensitivity float32
	Credits                    int
	DebugClipboardRows         int
	DebugClsnDarken            bool
	DebugConsoleRows           int
	DebugFont                  string
	DebugFontScale             float32
	DebugKeys                  bool
	DebugMode                  bool
	Difficulty                 int
	EscOpensMenu               bool
	ExternalShaders            []string
	FirstRun                   bool
	FontShaderVer              uint
	ForceStageZoomin           float32
	ForceStageZoomout          float32
	Framerate                  int32
	Fullscreen                 bool
	FullscreenRefreshRate      int32
	FullscreenWidth            int32
	FullscreenHeight           int32
	GameWidth                  int32
	GameHeight                 int32
	GameFramerate              float32
	IP                         map[string]string
	LifeMul                    float32
	ListenPort                 string
	LoseSimul                  bool
	LoseTag                    bool
	MaxAfterImage              int32
	MaxBgmVolume               int
	MaxDrawGames               int32
	MaxExplod                  int
	MaxHelper                  int32
	MaxPlayerProjectile        int
	Modules                    []string
	Motif                      string
	MSAA                       bool
	NumSimul                   [2]int
	NumTag                     [2]int
	NumTurns                   [2]int
	PanningRange               float32
	Players                    int
	PngSpriteFilter            bool
	PostProcessingShader       int32
	QuickContinue              bool
	RatioAttack                [4]float32
	RatioLife                  [4]float32
	RatioRecoveryBase          float32
	RatioRecoveryBonus         float32
	RoundsNumSimul             int32
	RoundsNumSingle            int32
	RoundsNumTag               int32
	RoundTime                  int32
	ScreenshotFolder           string
	StartStage                 string
	StereoEffects              bool
	System                     string
	Team1VS2Life               float32
	TeamDuplicates             bool
	TeamLifeShare              bool
	TeamPowerShare             bool
	TrainingChar               string
	TurnsRecoveryBase          float32
	TurnsRecoveryBonus         float32
	VolumeBgm                  int
	VolumeMaster               int
	VolumeSfx                  int
	VRetrace                   int
	WavChannels                int32
	WindowCentered             bool
	WindowIcon                 []string
	WindowTitle                string
	XinputTriggerSensitivity   float32
	ZoomActive                 bool
	ZoomDelay                  bool
	ZoomSpeed                  float32
	KeyConfig                  []struct {
		Joystick int
		Buttons  []interface{}
	}
	JoystickConfig []struct {
		Joystick int
		Buttons  []interface{}
	}
}

func copy_config(cfg_new *configSettings_new, cfg_old *configSettings_old){
	cfg_new.AIRamping = cfg_old.AIRamping
}

func override_config_for_rg353p(cfg_new *configSettings_new){
	cfg_new.GameWidth = 480
	cfg_new.GameHeight = 640
	cfg_new.MSAA = false
	cfg_new.JoystickConfig[0].Joystick = 0
	cfg_new.JoystickConfig[0].Buttons = []interface{}{13,14,15,16,0,1,4,3,2,5,9,8,10,6}
}

//go:embed defaultConfig.json
var defaultConfig []byte

func main() {
	var cfg_new configSettings_new
	var cfg_old configSettings_old

	fmt.Println("Upgrading config.json for Ikemen-GO-SDL-OpenGL-ES")

	// load default for new config
	if err := json.Unmarshal(defaultConfig, &cfg_new); err != nil {
		fmt.Println(err.Error())
		return
	}

	cfgPath := "save/config.json"
	if bytes, err := ioutil.ReadFile(cfgPath); err != nil {
		fmt.Printf("Error1: can't read file %v\n", cfgPath)
		return
	}else{
		if len(bytes) >= 3 && bytes[0] == 0xef && bytes[1] == 0xbb && bytes[2] == 0xbf {
			bytes = bytes[3:]
		}
		// try open config.json as old config format
		if err := json.Unmarshal(bytes, &cfg_old); err == nil {
			// copy old to new format
			copy_config(&cfg_new, &cfg_old)

			// save new config to config.json
			cfg, _ := json.MarshalIndent(cfg_new, "", "  ")
			if err := ioutil.WriteFile(cfgPath, cfg, 0644); err != nil {
				fmt.Printf("Error: can't save new config to %v\n", cfgPath)
				return
			}
		}
	}

	// try open config.json as new config format
	if bytes, err := ioutil.ReadFile(cfgPath); err != nil {
		fmt.Printf("Error2: can't read file %v\n", cfgPath)
		return
	}else{
		if len(bytes) >= 3 && bytes[0] == 0xef && bytes[1] == 0xbb && bytes[2] == 0xbf {
			bytes = bytes[3:]
		}
		// try open config.json as old config format
		if err := json.Unmarshal(bytes, &cfg_new); err == nil {
			// override specific config for RG353P
			override_config_for_rg353p(&cfg_new)

			// save new config to config.json
			cfg, _ := json.MarshalIndent(cfg_new, "", "  ")
			if err := ioutil.WriteFile(cfgPath, cfg, 0644); err != nil {
				fmt.Printf("Error: can't save new config to %v\n", cfgPath)
				return
			}
		}
	}

	fmt.Println("Done.")
}

