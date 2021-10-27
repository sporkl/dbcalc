### A Pluto.jl notebook ###
# v0.16.4

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 9dc16306-367c-11ec-3fe5-e7379ae6f0ee
begin
	import Pkg
	Pkg.add("PlutoUI")
	using PlutoUI
	Pkg.add("SampledSignals")
	using SampledSignals
	Pkg.add("Plots")
	using Plots
	Pkg.add("LibSndFile")
	using LibSndFile
	Pkg.add("FileIO")
	using FileIO
end

# ╔═╡ cb4c4944-b983-4ae5-9452-ada451c690ad
md"Upload an audio file. If an error is appearing, then it either means that you haven't uploaded a file yet, or that the file format is not supported (check the list of supported types at the bottom). Here's a nice converter: [https://online-audio-converter.com/](https://online-audio-converter.com/)"

# ╔═╡ f0d0c4c6-1a6b-47b5-8ed3-c78d2e8e055d
@bind upfile FilePicker()

# ╔═╡ a825452f-878e-407e-974f-a3b104934203
md"""Supported file types:

- .wav
- .ogg
- .flac
- .aiff
- .raw
- .sd2
- .snd
- .paf
- .svx
- .sf
- .voc
- .w64
- .mat4
- .mat5
- .pvf
- .xi
- .htk
- .caf

NOTE! .mp3 and .m4a are NOT supported! Please convert to a supported file type before uploading!
"""

# ╔═╡ 1315ca15-fab9-4514-8d0b-53d7f3478356
audiodata = load(upfile["data"] |> IOBuffer);

# ╔═╡ 0c4615ab-d0ed-4c00-a5d0-e210d6f9c93c
Print("dB: " * string(20 * log10(sqrt(sum(x -> x^2, audiodata) * (1/length(audiodata))))))

# ╔═╡ Cell order:
# ╟─cb4c4944-b983-4ae5-9452-ada451c690ad
# ╟─f0d0c4c6-1a6b-47b5-8ed3-c78d2e8e055d
# ╟─0c4615ab-d0ed-4c00-a5d0-e210d6f9c93c
# ╟─a825452f-878e-407e-974f-a3b104934203
# ╟─9dc16306-367c-11ec-3fe5-e7379ae6f0ee
# ╟─1315ca15-fab9-4514-8d0b-53d7f3478356
