package main

import (
	"fmt"
	"os/exec"
	_ "regexp"
	_ "runtime"
	"strconv"
	"strings"
)

const (
	RSSI  = "agrCtlRSSI"
	STATE = "state"
	SSID  = "SSID"
)

func main() {

	const wifi_info_path = "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/"
	wifi_info, err := exec.Command(wifi_info_path+"airport", "-I").Output()

  var (
    intensity = 0
    state = ""
    ssid = ""
  )
	if err != nil {
		fmt.Println("A command line tool 'airport' is not found in", wifi_info_path)
		fmt.Println("Please install airport.")
	} else {
		for _, item := range strings.Split(string(wifi_info), "\n")[:15] {
			wifi_state := strings.Split(strings.ReplaceAll(item, " ", ""), ":")
			param, value := wifi_state[0], wifi_state[1]
			// switch strings.Contains(param, ) {
      switch param {
			case RSSI:
				intensity, _ = strconv.Atoi(value)
			case STATE:
				state = value
			case SSID:
				ssid = value
			}
		}
	}

  ret := ""
  if state == "init" {
    ret = "#[fg=yellow]...#[default]"
  } else if state == "running" {
    ret = ssid + ": " + signal(intensity)
  } else {
    ret = "#[fg=red]✘#[default]"
  }
  fmt.Println(ret)
}

// wifi intensity represent by vertical line.
// intensity <= -90 is BAD. Icon is ▁
// -90 < intensity <= -80 is NOT GOOD. Icon is ▂
// -80 < intensity <= 70 is GOOD. Icon is ▄
// -70 < intensity <= -60 is BETTER. Icon is ▆
// -60 < intensity is EXCELLENT. Icon is █
func signal(intensity int) string {

	if intensity <= -90 {
		return "#[fg=red]▁#[default]"
	} else if -90 < intensity && intensity <= -80 {
		return "#[fg=yello]▂#[default]"
	} else if -80 < intensity && intensity <= -70 {
		return "#[fg=yello]▄#[default]"
	} else if -70 < intensity && intensity <= -60 {
		return "#[fg=cyan]▆#[default]"
	} else if -60 < intensity {
		return "#[fg=green]█#[default]"
	}

	return "error"
}
