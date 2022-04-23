{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 2,
			"revision" : 2,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 606.0, 174.0, 823.0, 706.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 13.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 0,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "vb01",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 2,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 107.0, 79.0, 481.0, 489.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 13.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 0,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "vb01",
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 23.0, 268.0, 298.0, 20.0 ],
									"text" : "Generated force is the sum of 3 differents forces :"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-2",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 102.0, 142.0, 122.0, 20.0 ],
									"text" : "eL[t] = L[t] - L[0]"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-3",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 78.0, 166.0, 186.0, 20.0 ],
									"text" : "-> Elongation-Speed of a link :"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 101.0, 184.0, 204.0, 20.0 ],
									"text" : "speedOf(eL[t]) = eL[t] - eL[t-1]"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-5",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 78.0, 106.0, 256.0, 33.0 ],
									"text" : "-> Elongation of a link (eL) is equal to the length of the link minus its initial length :"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-6",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 78.0, 46.0, 288.0, 33.0 ],
									"text" : "-> Length of a link (L) is equal to the difference between positions of Masses (M1, M2) :"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 102.0, 79.0, 281.0, 20.0 ],
									"text" : "L[t] = positionOf(M1[t]) - positionOf(M2[t])"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-8",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 78.0, 206.0, 124.0, 20.0 ],
									"text" : "-> Speed of a mass :"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-9",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 77.0, 346.0, 243.0, 20.0 ],
									"text" : "-> Damping of a link (proportional to) :"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-10",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 77.0, 385.0, 248.0, 20.0 ],
									"text" : "-> Damping of a mass is proportional to :"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-11",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 102.0, 224.0, 343.0, 20.0 ],
									"text" : "speedOf(M[t]) = positionOf(M[t-1]) - positionOf(M[t])"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-12",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 77.0, 306.0, 241.0, 20.0 ],
									"text" : "-> Rigidity of a link (proportional to) :"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-13",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 100.0, 403.0, 165.0, 20.0 ],
									"text" : "Fdm :: D2 * speedOf(M[t])"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-14",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 100.0, 364.0, 153.0, 20.0 ],
									"text" : "Fdl :: D * speedOf(eL[t])"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-15",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 100.0, 324.0, 97.0, 20.0 ],
									"text" : "Frl :: K * eL[t]"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-16",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 24.0, 8.0, 132.0, 20.0 ],
									"text" : "Notation (at time t) :"
								}

							}
 ],
						"lines" : [  ]
					}
,
					"patching_rect" : [ 674.0, 85.0, 76.0, 23.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"fontsize" : 13.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p equations"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-48",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 2,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 107.0, 79.0, 648.0, 826.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 13.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 0,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "vb01",
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"data" : [ 33224, "png", "IBkSG0fBZn....PCIgDQRA..BTF..L.IHX....P97ekV....DLmPIQEBHf.B7g.YHB..f.PRDEDU3wI6cm9cTblmuf+6SDQlZGDZAPaHVMdACdobYbw9pc4Zwq.1tptOsu87Gvzyb5ycYtm4L88dmyY5aOmYdws5yY5SWS2S00lMFCk8sJWkaJuvhMfAWFrYGIPncIDhEoTJ2h3YdQjQpLSkKgjxsHxuedAfx7Ii7AkYF4u32yummGgTJkvtj.PX6VyGOe77wyGOe77wyGOe77waShYTPYDQDQDQ4DJE5N.QDQDQDCJiHhHhnhBLnLhHhHhJBnvBJiHhHhnBOk7vjIfHhHhHJC3vWRDQDQTQ.FTFQDQDQEAXPYDQDQDUDfAkQDQDQTAlDLnLhHhHhJ3DfAkQDQDQTQAFTFQDQDQEAXPYDQDQDUDfAkQDQDQTQ.FTFQDQDQEAXPYDQDQDUDfAkQDQDQTQ.FTFQDQDQEAXPYDQDQDUDPQVn6ADQDQDQPQTn6ADQDQDQb3KIhHhHpX.CJiHhHhnh.LnLhHhHhJBvfxHhHhHp.SBFTFQDQDQEbBvfxHhHhHpn.CJiHhHhnh.LnLhHhHhJBvfxHhHhHpH.CJiHhHhnh.LnLhHhHhJBvfxHhHhHpH.CJiHhHhnh.LnLhHhHhJBnHKz8.hHhHhHnHJz8.hHhHhHN7kDQDQDULfAkQDQDQTQ.FTFQDQDQEAzJzc.hnoKjAv+mmIDFcb+3K+69QHv8ucz6S..qInSYkUFNvAdGTWc0WP5mDQDkcHACJinhRdT.txXZXn6Jvm7IeBPfwSYakRNGpIhHmNA.DRdFcJKPJk30e8WG8zSOI4dsxsSr43wjhhB90+5eMZs0Vi61MLLvq8ZuF5qu9R6i2hppJd625sPSM2bb2tttN1291GFXfAR6iWSSCu8a+1XwKdwY7+q4BgM.96NSHLpO+3L+WMyLVm20.5BM7.u5eM7VcsPZnGyiPB.E.8fH7e7+K.+iA..EOkgm5e6uD0rfFwe8Sphp8v4WMQD4TvLkQYMG+XGC80e+y3G2DSLwztMoThidzihgFZH6eblbxocappp3jm3jnu96KiOdCCCa+bksoo.b0wzvf2UfO8S+znAYA.rf+c+ZTwBaER8H8unwnJfd.e389adk3xjV4+k5XApZPvOcSDQNJLSYTVyW8UeElLRfQoJyYIlYLAD3wehGGkWd4w0NoThu5q9J32ue.DIyY660hFbkhhJd629sPyQxLlPHvS73ONJKxwwJCY82e+3O8m9SHPf.osuKDB7DOwSfpppJr+8uernEsn43uMRuvF.+ceoYMicl+q+X3+difqeuHYFaO+0vak0BoTGBgBl+JdLn3oLfj7QUoz.2qyyBivAADBXDNHt5672AC+iikOeETckkg24cN.pqt5xo++gHhn4NdszTVyi+3Odb+rGOdRZ6d50+zn8kzdZOVVAIEqJpXp.2LLzw5W+5m1vdZQJk3Dm7Dn+9rWl6jRI9xu7KA.ftdtOiYpJ.W89pXv6pDIyX2O58U6+teEppw1hl4NivASZ.Y..BgBp6gVO.DPHDHreeXzKcRD1+3XDXlTsTMjsDQDUbgAkQ4LG3.G.SLwDSKiYACDbFerz00gQj.Sdm24cPKszBZngFR6iwqGu..3ce2CfEu3lLuwDJqLcccr28tWL3fCZd2BA9g+ve.prppv9yA0XlUFxFYb+3O9e70wD26N3Y929yiTyXFPnn.OUNODNn+TFHVhLBEyuOEBrw+2+CvPOHfzrly99uxqixPP7tu6AYFyHhnhXLnLJmwJyYdzh+sYd85cFerTUUQ3vgA.vSu90i1RQFxrnoogPgBEo8OCZIgI.PhGaKwlwrLMjmyFRLUFxF7qOFBOw8Qsq7wPkMtDHsQlwxDqLmIf.PHP3IGGu2+qeFP3I.yXFQDUbiAkQ4bG3ce23xX1K8RuDprxJwa8VuUJG9QKFFFXe6aenu95C+8+8+8n95qGMllLjYk4q96ue7O7O7+Cpqt5QC0m50vKoTh2+8ee3y23Xu6ceQyXlWOdfPj8m4hxPgvo+O8xn+gGAO0e8+B7VScvSkyG5A7CqflrlmooUpmHoPOTPyGuP.HTvV+aOLL7ON99u7qgxEgvAXFyHhnhRLnLJmyJiYUTQE.vbBA.fnY9JcTTTvwO1wvfCMDV2ZWGZaIsk11KkRbxSdRze+8iGacOFZICA8EasqE2jMHGsRRnJLvnW9j3NCOBVvJeBTQisA8DFpRa8TKs9io25n2hTBghJp6gWOzmbB7d+W9Bn3+9QyfHQDQEWXPYTdgggQbKxoB.7xu7KmxLlYXXf8t28g95qW7O9O9Oh5anAz3BazVOWkEY3QCNCB9HTnPwuHrlkGoOq0graMV.LlgGHT0fQ3fl0ClcFpxjlYL6D9lDFgBBivAfWOdgprbyLnQDQTQGMaMTIDkEDaFZjXpLlMYRVewTTTvw+riggFbH7nqcsn81S+r0LVVAiULsZuHAvUGSECdOUDLXHH0CGcsFy1Gf4HivgfR3fvaJlUrDQDUXow.xn7AEEEbnCcHLwDSfW601G5omdMucUk3pcKqZHq2d6E+z+weJpu95mQqYXppp38e+2GABD.szRKy59a1NbNivAMqkrgFAO4e0+uvaM0AuyuQH00y7CdtRJgh2xwF+u7Avv+334eo8fxQXbvCdPr.VaYDQTQCN7kTdyi8XOF..zzhISMx3WOyjRIN0oNE5omdvZW6ZwRVxRlQOGIa8Ma1XZCm4bjJjXzKeJbmgGA0thGGUtvoWKYos58skT+3MmUlOCzmzGdu+SmFpAFaFM7tDQDk6wfxn7tCdvChIlXhnYD6EewWDUVYkX+u89QyszbzkLi7YAoKgY.gBg.G7fGDM0TSYk0nLq0krac+3qkLYRW1KlqAAl9GuQn.l0VlWuPSTVNY1kRDQzrGCJix6RLiYm8rmE..g0CCgPfPQlUl4yZBK1vSV+5WeVaQiM55R18TQvPggTOLDE70KLFLFQDULhAkQEDRIvgNTxyX1e+O4mfFZngLtFlkqDL3LeGGHUrpkr9FbD7j+O9SQY0TO7N+FSXyOetNcaloOdIWGYIhnhLRvfxnBDgXpLlYs9kYkwr0t1GEKIC6MlYad73AgCGFRoL6lgNoYsjc2gGAKXEOFpbgKIIagRhX96Yyys8d7VsxPODj5gR4dSJQDQ4eBvfxnBrDW+xTTMGlu7kvgCiW8U2CFbnAwO8m9SQcKntr99copmx.DZvHbHnm1sPoTc61MXsz+3kRXNKL+O+6gQ.yYgIB3yFGWhnhAKaYKC+pe0upP2MnbHFTFUPonnD2J6u.HutNZooogu3KNEFXfAv5V25PyoYOxb1RZNMBlSGg4ZOv5uMmElOMzmzGd++yeIjSb243wlHJeYngFpP2EnbLFTF.927u4Mwktzkw+z+z+DdnG5gJzcmRBVqGY8zSO3m7S9In95qG6YO6A80We3EdgWvb1Xt+8OmVqwRmvgCi8rm8f96ueL5sGMtMv7bqLW6W45JLybE9OH7noAkx7hCdneCVvBVvb3YjHJeXnAGDOyy7LLiYtXLnL.7m9x+DN2W+0X7wGuP2UJo7EewWft6ta7nO5ihkrjk.MMMHkxn0VVHar2XNaYsdnMv.CD2skKY2i9bctQZ2GuD.pJJ3YdlmA0VasywmUhnbsqd0qhSdxShae6aWn6JTNhRgtCTLvSj0EKttMkeYsdjYMaG+M+lCgO+y+bzZqsBgPfW5EeQrgMrAzWe8kad983ABg.G5PGBm5TmBM0TS4jmm3kgPyxKQjIh9mRjcmsoDQ4NVYy25bmj6CyTFUPDasjYkgp0sNyYiY4kWdbYLKY6MlyUd73AghLaKe5m9oyoAjENTH.oNDpZPQyKzMRb1WFib65GK..Tz7.CUOHXnPPxU0ehHpnACJixqLLLvd26dQO81C9u8S9ugFanQzVasE89000iKdEUU0rZFLMmskuJFXvHy1x5pC0kC2+G83wC98+gOD9F2Gdy+5+Gvn2yGV++g2FksfEAoQx22KsUMkklIjYJe7BEXDXB74+Mu.TBLN9Cu2APc0NeVOYDQTQBFTF.DJlihqlF+0QtlhhBNwINA5u+9wZdj0fktzkNs1DNb7YuIatdZooogO+y+bbqacKr10sVzRy4lIRfEEEE73O9iC.fI55bXzgtEzCGHRTSIO7IaEBpb173kPJMvnW5TPKz33oepmD0VKCHiHhJVTRGExa9luItzktDt3Et...9y9y9yPUUUE9m+m+m4rvLKKZFx5oG7O7O7OfFarwjtdfonnf268dOLwDSDc1Q9C+g+PTYkUh24cdmY8rwTWWGuxq7JXfAF.+re1OC0We8ng5aXt9eKaKPf.Pn5APnESl+lAY.LoYFaF93iPwiWn.uHXPNzkDQTwDs45zu2I6q9puBm6bmK5Oe9yed..NKLyATTTvYNyYvMu4MwZVSxyPFf4jsXcqac..QmMlVuFENbxGtO6PUUcpLjs10lyVpMRMIj5g.jggPQCJpdgtte.X.a8IvrPslIz7.gpGDJTXHY.YDQTQGsR0.x.R8LXgyByrGq0irt6taLzPCAEEEasdfIkxnYLau6cuQV+xl4YLKoYHqgTmgrvgCiW4UdEL3fCB.ygN8.G3.y4U4eglW7c9a9sXf6LF9x+u+Kgd.e3a+ue+n7ErPHiaevLGPHfQvIwI+adAnDXL76euCf5qcdrVxHhnhLkzCeIk6Ykgrt5pqotQaj0mXyXl0rwzJiY551OiYppp3zm9zn+96GO4S9jXgKbgos8ZZZ3zm9Kv.CLXzaKPf.194KUDBELuU8TXh6MIt60OGBd+QfTOHhOKYy189xL83EPZXfQu7ofVvwhTKYbcIiHhJ1TZGTFSHVNiTJwd26dQ2c2MFbvAghhB1+92OZqs1PaKosLe.hvb1XNUfFBgvV0XlttNd0W8UQe80WzEZwcu6cixJqroZTRhgQJkQWg+e228cQSM0TVY4xPSA3+3SB3yOvNqxKFZbso5CS8rOGeVR+iWQyKDFdQffy8fLIhHJ6qjNnLQJhJiyBy4NgPfu7LeItQW2..lYLa8qe8y3Z4JwkDi3qwrTuh+qpphyb5yfd6q2n2Vr0OXl3wqW7s+1e6r1lSt..Ka9BXToJfdH.CqZKyCz0MvbOfrj+bJAfPUyrVxBGFxvgyEOUDQDkETRF8wa9luIt3EuHtPjYcYh9w+3eLppppvO6+ueFdvG5Ayy8NmoXyLlkAFbpsvHCCC77O+yiJpnB7Nuy6D2ZSVrLLLvdd08DMXJoThd5omo0NgPfW3EdgnY9RUUEG3.G.M2by3kdoWB80We3Vibq4x+gPv.Y+U5dglG7G9v+UL939va9+7eIt888g0++x9Q40l50srLKwoqi.PHgDQpkr+2dAHBLF98+l2A0ufZyoqKaDQDM6HQIZPYm8rmM5pEexXEr1XbVXNibxSdRzau8lx6+q+5uF..SjlUneIj3Dm7DwsmTlz1ESFyr32u4vxchSbBLzPCY2tcREJTHHyEYuRnfG6wdLHMj3tcbFbmQuGjFFPQyKjFlYwxPelNyHiOiuBUU.HfPQ.iPAvvW3ygZPe3a+jOAV.CHiHhJJIPIZPY1cwHUQgEclcIDB769feG7Oo+L1t1WxRR48qHTve3O7Gfe+I+3DeYfM0OIDBzRKMC.fO7C+vTVb9o5wm3OpnHxoa8RRHwg+nOEi6yGdy+m9Kwsu68LW1J73EO8+92JgLmEcfHQZG6Qg.FA8iS827hH3XiBH.JyqG7g+12C0sf4ipqolb1+eHhHZtqjLnLJ2XsO5ZmyGCgPf0t141wwZVaVLSQwJiYF3dc7mvcF8NScmFFPwiGHCqD2iIUYPSnoAHEPHTfgHHF9hm.R+iA..UAvS8jONyPFQD4.TRFTFy+EUrPBf+0O5iit1sELTH7W7WYk4roxJlhmxvS+e3sQYyqQHklqqYBg.5QxLVfwtMDPfx75A+92+PntZmm4iSQgYHiHhbHJICJC1bwgUkyBSJGyJiYVLLLvc63KwcF8tSqsRCCn3wKLz0MGHSg.BQPbqKcBXLoYlwzD.O0S73nt5YlwHhHmlRpnN9Kdy2DW7BW.W7hWzVs+G8FuAppppv+x+x+BdvGjyBSJ+3vezmLsc8f.ACg+h+p2Did26iXqqLud8hO38NHpq14C.yf7pYdLyXDQjSTIUPYmKCy5xDYE7F2KLo7kDyblEcccyLncm6E2sqBfu0S73n95qOO0CIhHJWojJnL6NqKSD2KLoBMgPf+3G+oX7wGGuvK9BXr6OFd+2+8QiM1Hl27lWgt6QDQTVPIUPYD4TYkAMCCC30iWHDB7s+1eatPvRDQtHJYtIDQEKBDHPz8BzfAy963.DQDU3nTJsM3EVe1sM1D6FhMQDQDQ4BZkRUK0u7W7KfOeiiDWox9y+y+ywktzkvO6m8yvC+vObBakfR7vO7Ckm6oDQDQTolRpZJ6gdnjGbk0hq45V25bDqF7DQDQj6CqoLXtnbBfos1PQDQDQT9BCJiHGmRohNfHhJcvfxHxwgS7DhHxsQBFTF.r8VgIQDQDQ4DBvfx...WwKHhHhnBMFTFQNTRNLlDQjqBCJCrroImJ9NWhHxMgAkAV1zDQDQTgGCJiHGJlmLhHxcgAkQDQDQTQ.FTFQDQDQEAXPYDQDQDUDfAkQDQDQTQ.ENyCAqXZhHhHpfSgwi.tlXPDQDQEbb3KIhHhHpH.CJiHhHhnh.LnLhbbXQGPDQtQLnLhbbXQPRDQtMRvfx..ffIdfHhHhJfDfAkA..IS7.QDQDUfwfxHxgRxgwjHhbUXPYfkMM4Tw24RDQtILnLvxllHhHhJ7XPYD4Pw7jQDQtKLnLhHhHhJBvfxHhHhHpH.CJiHhHhnh.LnLhHhHhJBnvYdHXESSDQDQEbJLdDv0DChHhHpfiCeIQDQDQEAXPYDQDQDUDfAkQjiCK5.hHxMhAkQjiCKBRhHxsQBFTF..DLwCDQDQTAj.LnL..HYhGHhHhnBLFTFQNTRNLlDQjqBCJCrroImJ9NWhHxMgAkAV1zDQDQTgGCJiHGJlmLhHxcgAkQDQDQTQ.FTFQDQDQEAXPYDQDQN.JJ7qrc6zJzc.hHhH2jt5pK7hu3KBYVdQvzue+..nyN6DqacqKqdri0pW8pw92+9yYGeJ0zjfELL+E.QDQYKABDDm6bmKmc7862O95u9qyYG+vgCmyN1T5ow3Q.WSLHhHZNqqt5BuvK7BnolZJmFTVtxUu5Uwd1ydfGOdJzckRVb3KIhHhxBrxfkOe9vZW6ZKzcmYLMMFRPgFqZPhHhnr.gvbrmzzzx50SV9PnPgJzcgRdLnLhbbXQGPDQtQLnLhbbbdWANQDQomDLnL..HXhGHhHhnBHAXPY..vANz+DQDQjKCCJCfknC4HI4vXRDQtJLnL.H32sQNR7pIHhH2DFTFXYSSDQDQEdLnLhbnXdxHp3DuPeZ1hAkQDQDkEwKXhlsXPYDQDQDUDfAkQjSCuLbhHxUhAkQjSCKXEhHxURgmeGLyCDQDQTAmFiGALyCDQDQyQW7hWD6cu6MtaSjv9XnTJwTYBI1u7UD2OKDBrl0rF7q+0+54b+5bm6b3G+i+wI+Nio67XO1ige9O+mOme9lKzJnO6DQDQjqvjSNItvEtPV634wimrxwYhIl.m+7mOisqxJqLq77MWvfxHhHhn4rG9ge33B94BW7hXewj4rG9geXr+8u+LdbN+4OOdsW60vku7kwZVyZhd6O5i9nynLmctu9qwO5MdCL4jSZq1e9yedrl0rF73O9iWvxXFCJiHGGVzADQEepnhJvi7HORzeV2vHt6uxppLt6OUBFLH.ldl2JqrxlQ8mI74aFk4tIlXBbgKbATc0UOiddxlXPYD43vhfjHp3W3Pgh6mkF16bWO3C9fwkwsu4a9F75u9qiKcoKg0rl0X6LlYUOaqccqC+pe4uLks6rm8rwUyYey27MQxX1Sfe9O+ewV84rAIXPY..PvDOPDQDkcImcW.YhYbKPf..XpLmY2LlY8U6UUY5yPmOe9h6mKTYLS.tNkAfY86aHhHhnTIKkwiG5gdHb9ye9nYGyJiYuwq+5Is8m6bmCqYMqA+e7292hye9yieYZxRF.vZVyZv4O+4wu3W7Kh610zx+4shYJCfknC4HI4vXRDUBvJyYIlwrxSQFyrxzUkUVkspgsJijIsDyXVgH3.loL.H32sQNPBd0DDQkPBGNbb+rVJVxLrpkLU0YVHNId7KD0uKCJCrroImI99VhnhYE7yQMG6.EhK6kAkQjCEySFQEmJ3AiTjHaeNpG8QeTbgKbA7VQpsru9q+Z7HOxif230ei3Z25V25vEtvEvu5W+qlSOeEhWGYMkQDQDkEwKXJ2nhJp.O7C+vvue+.vr1xt3EuHpnhJRZ6l4hOLLYAXV.xfxHhHhnbfDBpIKEs5zpsrr7rj7we7GG+hewunfrsKwfxHxogWFNQjiPBmrxgLttUUUUyxLsM2wZJiHmFGxI1HhHmEyfHKDCaoEEd9cvLOPDQD4XjqibovEYjFiGALyCDQDkyb8abc78+9e+X9tlHeyqPlvsk7uLJ16wZM3RJmcO93d9ibqqd0qFG5PGxd+monP1Mxkyd1yhezO5GgUu5UGYQmM+WKYVXMkQDQDkCEve.boKdoBc2HkDNsM.5rbhT74yGt3EuHlWM0TvpkLKLnLhHhnbnUr7UfKdwKNiebRDeNg5niNvO7G9CwJW4Jw6+9u+L9wmJ1cC9dlJmMHTYoXH+pu5qvO5G8ivjSNI..TTUyNG34.FTFQNNNrqpknRbdKyKdnG5glyGG0HAMTd4kmUNd4ZE6moZhIl.W5REWYvjAkQjiCKBRhJEEJTH.TXmcftIBg4BPwi8XOF9U+pe0zVDZy2jfAkA..m1voSDQDUzqXO3QgY+qppppnHyiBvfx.Pw+6aHhHhbbxxY73a9luA6ae6KZMfs10tV7Vu0aMiyv0YO6Ywq+5uNdvG7AS51zTgDCJCn3efuIJIjbXLIhJgjXMfUYkUNqxvkOeSfKe4Ki4O+4WTjgrXwfxPzLXRjihfWMAQTIjDW5Nlo0VmUFxV8pWMt3EuXAc8HKUXPYfkMM4Lw22RDULqX6bTSLQjLjMu4kwLjY2kSjrMFTFQNTLOYDUbpXKXjBkr04n9lu4avd26dge+9A.vit1GE6+s2OJu7xs0i+rm8b30e8WCqd0qFW5RWJi0P1W8UeEdi23Mh9yOwS7D3W9K+ky9+CLCvfxHhHhxh3ELkcYkgKKUUQk3AevGbF738gKe4Ki4Mu4YqGmOe9h64a90N+YVGdNfAkQDQDQ4d1LZ0ye9yi8rm8D8mslskO5i9nX+629YH6bm6b30dsWK5i+a9luI4CaYBaNnVs2JCY4yYmICJiHmFdY3DQN.SaFhG4GkR.gHlp1xZyUOxOmXlwrTYkytLjYYxImLoG2TYl97kMvfxHxogErBQTQnKdwKhW9ke4n+bf.Ah69uvEtfsBxwp1wVyZVCdm24chd61MiUm6bmC6ae6K5wY1pPryInUnlgAEUJ4+E.QDQzbyjSNItxUtRxuSgYvVo79ShpprpYUlplXhIl9yi..RqwoTXlYNYRZxL9YK6RiwifB+qBDQDQNbOxi7HodC91FQ7jXSls0x0i8XO1z6Gyhm+JqL+uR+ygujHhHhlyJu7xy60fUxTQEUTTzOlMTJzc.hHhHhHFTFQNPrnCHhH2HFTFQNNrHHIhH2FIXPY..PvDOPDQDQEPBvfx.f4BYGQDQDQERLnL.VhNjizzVsrIhHxQiAkgH6tCD4vH3USPDQtJLnLvxllbl36aIhH2EFTFQNTLOYDUbhWvDMawfxHhHhxh3ELQyVLnLhHhHhJBvfxHxogWFNQD4JwfxHxogErBQD4JovyuCl4AhHhHpfSgwi.l4AhHhHpfiCeIQDQDQEAXPYDQDQYUb3WnYGFTFQNNrnCHpXkhhBDBm6WsZ1+44XJTzJzc.hnYJdU3DULZYKaY3xW9xvqWuNx.advG7Awku7kQYkUVgtqTRRBFTF..bfe1gHhnhLd85EqZUqpP2Ml0Jqrxbz8emNA3vWB..IS7.QDQDUfwfx.XI5PNRRNLlDQjqBCJC.B9cajCgPHhdMDB9wWhHxUg0TFXYS6TYXXTn6B4c555Qe+pggdI0uCTTXPnDQtaLnLxQRWWG6ZW6B8zSOE5tRdkggAFYjQfttN1vF1.zzJM9HbM0TC9zO8Sw7l27JzcEhHJmoz3L5j6iD3F23Fnqt5pP2Sx6TTTfhhRI0+2qt5pQnPgfggAyXFQjqECJibjTUUvm9oeJBEJTjaQh41L1fO9r0ie1cjR+i2mOeXG6XG.BfidjixLlQD4JwfxHmIg.s2d6E5dAkm3ymOzQGc.cCcnqqWn6NDQTNAGG.xQRWWGaaaaCqZUqB81SuE5tCkiENbXnooAOZdbjqT5DQjcnMWGzBWgR9eA3DIQmc1I5omdPvPAKzcFhHhn4LEFOB3ZhgijH5LOjYNozB+3JQjaEG9RxYheybIKFBNQjaECJiblh4alY7YkV3q2DQtULnLxghe0boJAesmHxkhAkQNThX9W7KoKsvAvjHx8QBFTF..Xch6DIi4ewW.IhHxYS.FTF..jLQKNPwjoL9BXIE9xMQjaECJCfiFhSTbewLeArTByrMQjaECJC.Bdk2NOhT7uIhHhbnXPYfyiOmI9pVoJ9JOQjaECJibnhM8X7qoKkvDiRD4VwfxHmIVSYDQD4xvfxHmo3hCiYJqzBe8lHxchAkQNd7qnKsvWuIhbqXPYjimPxgurThfCWMQjKkBupSvRRxQhuykHhH2EEFOB32u6HIR5+jb+3GWIhbq3vWRNS7alKYwXvIhbqXPYjyTLeyLiOqzBe8lHxshAkQNT7qlKUI3q8DQtTLnLxgRDy+heIcoEN.lDQtORvfx..ffmi2ARFy+hu.RDQjyl.LnL..HYhVbfhISY7EvBzBJcN...H.jDQAQUJ7kahH2JFTF.GMDmHt2WVxhY1lHxshAkA.AuxamGQJ92DQDQNTLnLv4wmyDeUqTEekmHxshAkQNTwldL90zkRXhQIhbqXPYjyDqoLhHhbYXPYjyTbwgwLkUZgudSD4NwfxHGO9UzkV3q2DQtULnLxwSH4vWVJQvgqlHxkRgW0IXII4Hw24RDQj6hBiGA762cjDI8eRte7iqDQtUb3KImI9MykrXL3DQtULnLxYhqn+krX73DQtUZE5N.QyNS8UygBEFgBEJ5OqooAA2fDcsDLrLhHWJFTF43s8stUn4wC..TUUwQNxQPqs1ZAtWQ4NLfapzDuXS2MIXPY..fuO2IR.Od7.Od7f9GXfn2pllFlbxIiKyYoBynFQzLgTJQ3vgKXO+VmWSJk15bbEKDBAzzX3FYh.LnL..H4ng33nnpfO9i+3ocBRccc7FuwafAFX.X9VbYR9a.Od7fibjifVZok7aGmly3mWoBkadyahst0sAozH0MJxoYDBE.Hi7903O+SReXQt.QIjQZ1zO+UnPAA.v0t10vJW4JS6yu0+Xp9Q5+fSle9SQ6S73lvyO.vi9nOJ9s+1eaZe9ISLnL.NZHNPBHRY.U25V2B8zSOo8w6wiGLo+zmQMlIshS7kDJeyJCYSN4jnmd5NiA3D68amygLSaenPgx343lIG2bc+swFaDgBEhYLyF3uc.ffW4sqxQO5Qy3PLDNbX7FuwafAGbvjd+d73AG8nGEM2by4htHQjCxMu4MwV1xVPqs1J575cl1cUBgPfN6rSr8sucr7kub7QezGk1.WDBA5niqgcrichUrhUfO5i9nT1tqd0qhcsqcgUspUgCe3Cm19rPHvku7kwy9rOKV8pWM9vO7CSY6tzktDdtm64vC8fOD98+geeFOtW3BW.O+y+73ge3GFevG7AYr8W4JWAqbkqjYLyFXPYfSwd2F6LjjRoDCeqgS4UaZlIM+bVcVDhedkxWhOCY8fxKubrz1WZFeLSN4jviGOnxJqDKcoYt8974Cd73AUUUUn81aOksarwFKisK11eu6cOacbu6cuqY6p1dG2ae6aCOd7fpqtZa09aMr44ZW3BWXZaKwfxnRXG+XGOtLpEa.WgCqiW+0eMLzPCAoTxLmUDggES4Kc0UWXaaaankVaEW+5WGd85Mss+5W+5X6ae6n01ZCW8pWMisuiN5.6bm6Ds29Rv0t10fmHyh7DcsqcMrqcsKzd6KEW6ZWCd8j9i6UtxUvy9rOKV1xVlY6SQ+3xW9x34dtmCqXEqHssyxEt3Ev264+dXkqZk1p8m+7mGe+u+2GOvC7.3F23FYr8DCJiJQIDIulzrpUhfgBgd6sWze+8CgP.ud8VPm0UDQ4egBEB27l2DpppYLiW..ACFD27l2Dd73wdsOxwurxJKsYbx53VQEUjwLSEa6qrxJSa6CDH.t4MuIpolZr2wMf4wc9yed1p8VG+ETWc1p8DCJiH.XViYadyaF80WelCOlThgFZHnoogidzihVZoElkrhFb.Lo7CEEkn+sggQze1NsWJkYrbGThb+Y73FocBataUKhb7TUTs4w0datOJho9+m85Gh3ddnLiAkQkrhsdwBEJH5u+APO8zSzIxsllF750KZu81Y.YEQXHYTtlUsjEJTnHqGhoeX2Rr8YZX5h19vghtdKl91E173lh1kX6CGo8d7l9iaXc8YzwMjd3YzuOh1OxvwmlBCJiJIENbXrksrEzau8B.y.v1+9ear3Eu3oVZdf4vbxhSs3R5l4aDkMbyt6FadSaBs1ZqQqMLqrDkLc0UWXKaYKXIs0VzZCKcYI65W+5Xaaaan81aGczQGoLnEqYw4xV1RSa6rbsqdUrycsKr7ku7z19qbkqfcu6ciUtxUZqiq0rybUqZUniN5Hi0z1EuvEv284edr5UuZa0dZJZw78OktJ4+Ef6VzLhIAjByWtCEJDFXfAhFTlGOdPKszLZoEt8LQTopny1xIlD81aunhJpHs0FVhsOSyJxoZ+Dn2d6E0TSMXIKYIorcSDocye9yOosaZseRy9wBVvBr0ws95q2dG2HsuwFazVs2Wj1unEsnz1dZ5zX7HfiGhKlttN1xV2J5Mgk9BMMM71ucjLiAyEjzEsnEWH5hzLD+3JkqXsdjE+rsL0ot3F23FXaaaans1Zyb1E5wa5ZNt906Dae66.s29RPWc0UJyPk0rxboKcooscVt5UuJ18t2MV9xWdZau0rxbEqXE153doKcI7c+teWrpUsJzUWck4Ym4Et.9deuuGdfG3ArU6ooiCeI4ZDJTnosRaGVOLFbfAPe80Wb2tYlwZgayRNP7BIobkPgBgt6taaOaKsZuGOdr4rhzr8kUVYoMCRVsqhJpvVYZJXvfn6t6FUUUUY33Z1tTkgtDEHX.zc2ciZqsV609.lsut5piYHaVhAkQtB555XqacqSawfUUUEu8a81XwMEeVvDBAVzhVT9rKRYILSYTthHWOaKUr4rszlsKY8ir5wMRczY2EMaqiKWjsm8XPYjiSRyHV3vXvAGbZYDSSSCM0RSnsVaKe1EobHACKixxjRIBEJDBEJD750qsl8jyt1GNsse5sKyyJR6zOl0G2vQZuMlskw0dNrkyZLnLxQwvv.aaaaCc2c2wc6ppp3W+V+ZzbSwuzUHDBzzhaJe1EobNdU3T1U2c2M1zl1DZokVlZ1VllrIYMaKaqsVwUu1UgWOdQ5RNj0rsbIKI8qb+Vy1x1WZ6oscVt105.6bm6Hiqb+W4pWE6dW6BK2lqb+V6Ylqbk1ak6+hW7h369c+t3AdfGvVsmRNIXPY..o8CSTgWrYFSWWOkYDqklZAssDlQLhH6wJCOSLwDnu95KiqX9I19pppJz9Rre6S2rsL11M+4MuLNKGMauOzWe8gETapmskgBEBSF43VeFp0qDOtMzXC1p89hb7WzB4rsbtP.FTF..jbzPJZYXXfsu8sit5pK.XlQr25sdqjVf9M0DyHVo.94UJaI55QVKsfq2YmvaYkk11OUFxZC235WGdrwdgoYFxZGccitflmj+UtVYHK5rsTK8e070t1UwN24tvxV1xx3rsb26d2ynYao45Q1JsU6iMCY1o8Tlwfx.3ngTjHY0JlUlw5u+9A.flpJZt4lPaswLhUphY1lxVBGJD5omdfppFZ2ly1xd5oG3wiWrDaLaKsZe4kWVZyhevfAQO8zCpnhJr041BFz73VUUUm11acbqolZr4w0r80Vas1p8ABD.8zSOnt5pimSNKgAkA.Aux6BNoTNUFwr1mif4r44se62NtLiwLhQDkML0d4nvVy1xolclhYzdaoHM6F.VGOy+N6tGTZ2YkYhsmy1xBGFTF3TruPI1LiYXnigFZnnYDyhppJZpIlYLZJ7yqzbkUsPELTPyYKXFF1xol8hlsuLudS2ZD6TG+nyFwxPxVUYm1rhzt8ivgR6rnL+MaRsW6I6iAkQEDIVqXVYDq0VmZaNxJfMlYLJV7Zxo4pd5targMtQaOaKu4MuI1zl1DZKl81RkzjcnabiaXtWXFY1VZFzxzaemc1I1111FV5RS+dfokN5niH6ElKKss+ZW6ZXG6XGYbOvzxUtxUvt10tr+dg4EuHd1m64vC7.Of4daICJKqgAkQELCO7vQyLlppJput5PyMO0RZgcS4NQDYGQmcgSNI5u+9QkUVosmsk82e+n5pq1lydQy1OuTLKJSreTasyOsiFPzY4nOen+96Ok0vUhsq95qeFcbW3BazVse7HsewKdwbTLxxXPYTAghhB9zi7oHbnv..PZXf8suWC81WuQu+icriwoWMkDb.LoYmd5oGrgMrAzRKsDydaYpEMCYs1p4daYFZerYHKcs+5W+5Xqacqn81a2VyZQqLjszkk98ByXyPlcNtW4xWF6Z26FqXkqLxdUYlmclO6y9r1duvjl4XPYTAShKpq24t2ACLv..vLnrIlXBDLXvopDiH+COd7vBKsDFCIilohMCVCLv.ynLjMv.CfplAYHafAFHyYHKR6l+7sWFxrZ+BVvBxXFxFXfAxbFxLjHTXy0WrAFX.zXi1KCYVG+EsnEwLjkivfxnhFe5m9IHbXc.XtTXru8sOzau8FWaTUUwwO9w4IDJgIXUkQyPc2c2XiQpgrN6rSamgrVas0oxnVZpr+DyPV5Vw92111FVZ6KMsqaYVhsFx5pqtfVJV+xt5UuJ14N2Yz0irT0NKW9JWF6d26Fqbk1e8H64hTCYb8HK2RKcyfjRFk7+Bn3vhSLyY24NXvAGLtaSUUESLwDHPf..vbpXyLmQDkNgBGB81auPSUMsYHKZ6CY1dud7ZqRnvp8kWV4o8BFsZWEUTAZssVSY6rDLXPzau8hpqpp3lDTSuclG24Mu4k11k3ws1ZqcF095pqNa0dZ1SieUF33gTj5HG4HHb3PQ9Iy2opqqi8t28FcaVRUSEG+XLyYtcwEzMC.mlgrVWuDJJPWWGppp1q8p1a8KyZcFSjg0urY75QVziqMe9yQquXb8HK+gCeIUzZwKdwI81iMCZlYNaxnYNKVd85kmDo.HXv.Y8sBI+9CD8ZmB3O.BT9ze8NaPHDQJ1Y99F2.oThfAChfAChxJqLTlMVGvBFLHBFJR68Zy1GLTZO9FFRDJTla2L83Z0tPglYGWq1am0ir3N9Y32GzbGCJibbN5QOJBG1bVapqaf8rmWcZK5rZZZ33G6XnUlAs7Je97g0u90i6bm6jUOtFFFXr6eeHkR73O9ikSVtTDBAps1ZwINwmipqtlr9wmx+5o2dw24YdFzbyMiqbkqfxJqrzlkrt6targMrAzZqsZq0urt5pKroMsonqGYopTJtwMtN1xV1BZucy0irLUyWczYGXaacaXYKMyqGYae6a21qGYW8pWA6XG6z9qGYW5RX26d2QWOxXsjk6wfxHGmDyf1ctycmVsmoooEWsmAvLmkqELXP32ueLzvCgQu8nP.Aj1p1.hYe0Jlay7Vm51stp9gGdXa93syyt06GjPWWGiM1Xvvf0yfSmUFdlXhIvfCNnslskACFD9hzd6rdjE6wedyadobVQFa6xTMbIkFHXvPXBelsOU0vUz1MgOL3fChFpu9Lbbi7+uHG2EtvEZy1ad7W7hWLqkr7DFTF43czicTnGIyYVz00ijAMykXCMUMb7O637DK4HiO933YdlmAS5eR7Ie7mf4O+4Wn6RyH28t2Eqe8qGBEFztaf05QVyM2LtdmWGdKyty1R6s9kYMaKaqs1hY1VN8oMm05Q1RVRj0iLsLrdj0YmX6aa6XoKMSqGYcfcricDcVYloLXc4qbEr6csKrhUXuYao05Q1JW4p3rsLORBFTF.XcC6z0jMp8LOLyY4TRoD8zSOvue+nkVZF0V6BJzcoYjZpoFy.xXRxbEBGNL5s2dgppJVR61e1S5wimYzrsrrxJydy1xxqvVWPXnHyhxppLSy1RyYCYM0TiMOtlse9ye91b1VF.81auXAKXA7BYyiDfAkA.j0KJYp3vwN1wio1yzwq9pSU6Yd73Ae1m8YnkVZoP1EcUTUUgppJBqaTn6JyX555LfLWDqK1Rwty1Rkolcl1a1VpD8ukFFob1QJh43Zq9czia5uXwb+rsTcF0dJ6gAkAvIZkKUr0dlDRbm6bGLzPCA.yfx7kPlyrvLnM2veyQEJy5YaYj1W9Lr8k4srjNTKQm0hQ6G1bVNFo8dS0rszPhfypYw4L62GSMaNKOssmx9XPY.PvqP10S.fie7ialQDXN7Fuxq7JXfAFHlR81LXsO+y+731XzIhbF5s2dv5W+yfVZt4nydxzkkrd5ta7Lemui4rs7ZWCkkoYa4MuI13F1.Zqs1v0tVGvq2TMaKuA1zl1TzYaYlpIqN6rSrksrErrksLzYmclxYmYGcbMr0ssMr7ku7z1NKW8pWEae6aGqbkqDc1YmYrl1t7kuL14N2IV0pVkY6Ysjk2wfx.G0hRCh3yblTh6d26NsYxmGOdhV6YVksKyb1LCKG.JeK1Y43PCMLppppr0rmb7Il.CO7vnlZpAKIC68iACFDS3yGFd3girmUlrYE4TyZwgGd3LVSVS0uMae80WeRKohXmcnCO7vngFZLskdQh8iEsnEMiZeSM0DKsiBDFTFUxJ1LmYIb3v3ke4WdpIH.yb1LCickJ.hc8H65WuSTVFl8jceyahMrwMF+daYZXsdjE+rsb5tw0uN17V1BVR6oeOvzRGczg4dgYjYaYpx7k05QVl1CLsb0qdUricrin6ElYb1Yd4KicsqcgUsJNaKKzXPYTIIgPjzcL.CCi3xflWudil4LlwrLS3v2Lccvc8RZgCGB80Wely1RaL6ICGNL5qu9fGOdr0VzVnHG+xJqrzOqHCY1tJpzly1xH8ipqtpzlYpPQNt0TSM1JCVACFD80WeX9ye9yn1WWcKfYHq.iAkQTLTTTvm+4edzLnEJTH7RuzKgacqagSdpShVZlmvJcb3wjAoStyWBSfolskg00gVFlskHlYOoggdzYaXJaNhY1VJMfPj75NK5rxTnj18.ynsWXMKJyvr8L5d2o8dCZzYwoMuHRgM6GTtGCJqDRvfAgggQxW.zS3FE.vaYkkzSpD83jgGuDV6kfNiLLYNSLkn95qO5sEJXPbm6bGL7vCCCG3R8PdWReukChStuWBRJkHPf.SM6IKu7zdQAQaef.1d1HFHPfo1KLKqLHiFBXp6GY73ZHQfflsu7xKOs6skVO+kWd4nbarWbFHP.DJxw0a41r8gBk19Ak+vfxJgr6c+r3ZW6pl+fD.JwexEoTFWlNNxQNBV4JWYbGCoThctychN6nyo83isMVDBAN1wNFV1xVVV7+IYe555Xyadyn2d6MtaWSSCG7fGDM0TSXQKbQEndmChSOUYjiRu81KV+5WOZtolvUu5UM2aKSSVu5t6tw2467cPKszBt10tVj81xT29adyahMrgMf1Zq0nyhxjk8ot5pKrwMtQrjkrjnsKcWH50uw0wl27lwRaeooc1Y1QGcfst0shksrzuGXZwZ1VthUrBa09qbkqfcricX68BSJ2SimCEkL+BXz6LZLy1PABGNTb2upp5TowFhos0EE83b6Qwv2Z3nKLqIJ1ii0h2Xwn.ABDM.xvgCiQFYjoMaL850KZpolXg9STQDqL7LQjYinclskw19ZpolzVKYVs2WLy1xjuGTFe6xzdaogThfwz95RyrsL1iaCMzPFm8jw19EtvEZq1O93iigGdXr3EuXVKYEIzJQhGI8JQFxh+3gObj.wLeUeqacaSk4L.7QezeDqZUOPzrcrvEtvocLDBA93O4iQnPgvV1xVPmc14zZym7IeBVwJVQjeRhEVDlgIcccroMsYzau8..ysgoCdnChlZp4oksmEsno+6AhnBmd6oGr9m4YPyszL5ryNiLraoNECwlgL6LaKuYW2DaXiaHyy1Rq0irkzN5pqa.OZdSa1hudj0irktzkhadytfVJV2v53Zcfstsshku7kiadyaZ60irUrhUXq1G65QlcZOk+vWIJgjXPVd7F+IDZpolsUFgrNNZQNQUYwT6YBg.szRKEUYVJ1LhYITnPXzaOBt0stE.LW5KV7hYFwlqb5WjmSu+WpHrtN5u+9glpJZqs1xXMqFNbXze+8Cud7Z6YaY+82OJq7xSaluBExrcUVYknkVrwrsLR6qt5pQyoYRCELR6l27lmsNmTvfAQ+82Ops1ZmQsut5pimyqHCCJqTVBApLSGlQogY6O7gObLYFK4YXqPQ2v.adKaF8zcOwc6ZZZ3PG5PnolZJ5ssnEU7kQOmFoCOrFmd+uTiHR4QX2L8HTD1ZuvzZqSRQj98ByXuXT6LaKst6rU6RV+HWzdJ+YVETVxm8col2Lr0UPNKABD.FFFvqWyY6TyMWbjYrjkQrvgCiaOxsilQLKd73EKZQKpnne6t3zqEfYW+2rFcBNqe7IRHDblvkFBgvb1HVt81aFEJyr1qD83m9WClw8CghsZ+TsyduGXl2ODb1VVDRhYYPYu1q8Z3jm7jQ+4Di1NwuX727a9M3a+s+1ylmJpHzN24NQmc1Id228cQ6s2dQQlwLLLvV1xVP2c2cb2tppJNzgNzzB9RHDEE8axc3N24N3oe5mF974K5skoyKlJBg.MzPC3Tm5T19KYK0zVasgN6rSnppBUajkrkzV6l6UjppPISYIC.s2dj1qoFcMBKYhcupzNIcZEqXE1ZOqbUqZk1pcVV8pW8Lp8O3C9fbusrH0rJnr6d26hQFYjn+bnPSeV7EalwBkvr7qXSoaFbmYWUuUFxFczQwHiLBV3BWXAISSoLiX291w89R.ygobQKZwLiX4UN8rkMyYXXfae6aiwGeb.XF.VhyNYyu3N8mrw5wEvue3y2DQucl4r3oppNi9Lsl1Ls8Z1p81scEKGWKd73gmSrHj.yxfx1+9eGDLXfn+7K+xuLN0oNUze9cNvAvSGSlwZngFl88x7fR2MP4YVzn6bm6DczQG3fu66h1W5RKHYZxPZfsrksht69lwc6ppp3PG7fn4DlV2LiX4ekh0kUc0UGt3EuXzx5XzQGEqe8qOZlypu95wINwIPUUUUZONiLxHX8qe8Xz6bG7HOxi.EEADBAZrwFwIO4IYlyHxkaVETVCMTeb+bhWA2hcZ0pSo22gLiDaFxt8suMV3hxuYHK1LioqqiQGMUYDyg89NWpRwONonnD2doZEUTQbYESQQAs1ZqnhJpHsGmxKqbTYkUBoThQG81Sk4rHqwVlYLyKJM+sLQteYmYe4bbV7UnIJYyTl8THyPlTJwV25VQWc0E.lpFwRbgNjYDiJljryAZmyKV6BpEey4OOjQx31HiLBd5m9owniNJVyZVCZrwFYslQjKVVInrDiowoMbfNrtaNWrYlRJQzLj0XNtFxrddicsWzLyXlO+.lAkwLhUbyo84+hIJJJnoXx3VYkUVzLmMv.CffgBhIlvrVyXfYD49jSVmxXh0clDQlbF6d26FW6ZWKx5tCvANv6hksrkgFarwb1ysTJw1111vMtwMhzY.fzLHrCdvCZtfOJk.LiXTIjErfEfKbgKfgGdXr90udbmQMq0rEtnEhSdhSlwgCkHxYI2r3wxnxbjB3eR32uez+.CfAFX.yYKlhYPPwtHql0d9hsVwLhOiXVrxLVt34mx9DQ+CmorYWOaLqtspUMMMMnnHfggAFbvAQ3vgs8RrAQjyAWQ+on10t2MzT0LWnUE.e7m7IXUqbk4jYOqggQbYFSQQA+leyuIoaAJMjCyPGkckls8OGAYVpyKQ1srHz00ggwTGQMMUtZrSjKTtInLdAbNR2Z33W06WPs0h5qu9LukjLKc26dmXpULETSM0f5qu9o0NUtaP3bDYXmcrxl88r3wRHDnhJq.RoD986GRIvjSNYzUlchH2AN7kTJs8sucnoogicriE2daY1fhhBNxQNZzEXSogAdwW5kPO8zyzZ2m+4eNZu81ypO+TNhSOUYYIY6eEzP8MfKb9opsracqagG4QdDrnEsHbhSbBVaYD4RnwyghR3eAD+kxWVYkAEEkHWItL59E4XiMFlbxIQ4kUNDJYueYk3DGX7wGOo0TlOe9vjSNYzaq7xKmCcCUbKKmsPE0opsLgXpZKSWWm0VFQtHZ7q1fyd3VlSh+U+Ce3CiUtxUhMuoMgN5ryn29t28tyYYLKVG4HeJBGN90xICCC7hu3KFMCZppp3Dm3DXIKYI4r9AQyY4nSrl3ZclppZI7EURj6SVd3Kc5ETRosEuXyY4XMyadnhJp.9C3GRijjwrbTlpZrwjuTWL93ii6bm6...Ukom4LKLCZEdN8e6W72+Sx4WyVyNAhnBtrbPYLfLmLqrT8ge3GhvgCiMu4MgN5X5YL63G+XX4KO2kwrXIAvQO5T0dlggAdgW3EPu81abWCfllFNwINQRm8lT9iSeeuzY1+44cIxsfKIFzzXUqW0TcjLlkXMlc+wyoYLKVBjrZOyWzLmYQSSiYPqnvzCPv58OSucI60D6VkqYmGuP.Td4UjvsmcjadGWxNp781D4FHACJiRiO7e8Cgd3vXiaZSnyXpwrcsqcAMOZ33G+3X4Ke44890QO1QgQB0VS3vgwK7Bu.5qu9h610zzvIO4IQqs1Z9rKRQL93iim5odpoED8rQz.qirUbkMTas0hu7K+RnjCV1Uxe4uhYJiH2hbTPYNqSRT5lDkz+5TzLlUSMwmwrQhuFyJq7xgRd7WhKLIKlrRoD97k7LnMdBYPyJWJLCZ4JS89JoTh6cu6M2CJSJQvPg..fGOdxZutIDhbzrWLONPn7svD4JHPNJnLmVcYT5Nixs2qSG9vGFgCGBabiwmwrctycBOd7TvxXVrDBAN1wNFBqqG2+qBqqie3O3Gf96u+3ZullFN0IOIZgYPKqK1O+Wc0Uiyd1yBCCio0pj89uTM3i2+92GO0S8Tvvv.m4LmAye9yOEO218c0lsTQQAUUUUYkL4EOQ96RSKYO+EQtObCIGvA1gyur1lkrxXV.+Afgz.iLxH.H2OqLsqjsgompLn4wiGL9Db8OKWH1eCJxRaf7UWc0PHDPHDn4laF0TSMy4iIQDUrIqDTlS+qwD7JMskCe3CiPgBgMswMgNudRxX1m8YX4KaYEvd3zIDBb7ie7os9NENbX7C9A+.Lv.C.fHYN6TmBszRKEhtIkAw95WhuVVJIwKZvbnWc5mAlHxRVInroMupliA43OP.XnqixKu7bRA3lHFSl8DMiYyK9ZLKZFyt+8wDSLA.L+xi7cslkJIKCZFFFwkAMOd8hwGe7n8eqkaCq8VPlAM6KWWN.khed0ZOuL1OeUd4kiJqrx74.kRDkiUTN7k64UeUblybF79+2+uim5a8sxJ8IJyrafG+w+3eDgCGFabiaDczQGlOVXlwLMMsnGqO6y9LrrhrLmYQQnfO6y9rnYcwJyYQq8rHAk40qGbpS8En4latv0Yo3TJFd7HiLBd5m9oitv.dviF...B.IQTPTsuzPiMfScxSgpqtZTN22KIx0nnZCIOPf.PWWGCNzPXvAGDgBFL61uJw42u+3J35DK95ImbxoxTDPJyTYM0TCjRYb2mDHZFyrDaly..pnhxgPj6y7osHhOCZVYN6d26dl2PjQExiGOQyfVEUTAyXVFHh9GNSYytd17sJFFFXf96G9CD...pBUzbyMixJqrr2SBQTAWQ05T1q9puJN8oOMFczQAf8ybCYO6d26BW4JWM5OOxsiOHpctqcBM0HukP.b7icbrpUsp3ZiTJw1111PGczwzBBKQaeG6vbu4C.JJlYlpPOKMSEEEyL6YXnGWfigBEBO+y+7X3gGFm4Lmg0bVFjepvob2v0ks1whjH61KEBATh7YI..CoQIcs0QjaUtInrY4YiFYjQvPCMT1suPQM1XiOUlf.PYkUFDw7Un9FeBD6KdSeYLv53LFt28tGJq73e7IZ7wGO5+VQQIkGuhChnYNKXvfQW6pBEJDFebyeuUb2+KRjG19ayoG9r4AOKbrRUsjUUkUN2O3DQEcJpF9x7QQ8WJ6Od3+HBqGNMsHRdNh7W0We8SqEBg.e7G+wo3pzi+wmnFpugYU+NeRObX7Lqe8n2H6L.d73A+1e6uEM0TSQmnCTZjGRUV5tPfhEYqd3su8n3odpmB97YND5MzPC3zm9znpppBUvZIiHWGshgITsUsNYkIBqZYJuEjVg9W.4I02vzCxZ1vsDbxjSN4zVM2CEJDt28uezLJ50qWrvE1HVzhVTgnKRNUyxrjIkRLo+Ii93Ge7wv.CzOBDH.pnhJPMUWMZpolXsjQjKkVtHdjYZsfsm8rmH0Rl4xSvANvAv25a8sPc0UWNn2kDbFkWxQWWGabiaB81aOwkcGMMM769c+NzTSMEsstkfPcKbBebUnD+4.EvdmWbzQMyL1DSLAjRILLLPf.APCMz.9hu3KP0UWM750aNpWSDUnMqF9xTOK9LKnjDmEexH+QpNmzPCMTb0RVCMz.yLAkUIk.98OYb0J1X2+dwUic.lCWYiLyXyZ4ijNmKeNlsGaoTF2tCwD97E28aDYmkHSAlM13iiAFX.32u+nYCqxJqD0Tc0b1VRTIfYUPY6ae6Cm3DmHRLXBbm6LZj6w7K71yd1i4lFLDPltqqcZOdSFFbVEQYWRoA1zl1D5t6tAvT0JVhq+XBgHo0RGYO4i881bYlxls8+6bm6fu0S9jX7HAiIMjwMQWFYjQvi7HOR7AkE47eVOy.lWfqe+9Q80WON8YNMprByB5WQQgYHinR.ypfx74yGt+8uejeR.ud8F2IL762OlbxIyPPYVSSqo+3UTTSwignLQhImz+zpUrvgCi6e+6G88sd73EM1HyHV1WtevEysqf8ytisTJw8GarXBDSfpprx3NZiM1XQuuodthOnLfHYFqlZPyMwLiQToDIlkAks+24cxoKrq4sZIibcLLjXyady3l27lwc6V0JlUlwXFwbxJ9lYNKXAK.W7RWDRirS.iLyXDUZZVETVcKXAY69QAEWiZc1hcVTlXFwrRHqGMMlYr7Fm7BU1rihhBVXiKrP2MHhbvDnHaE8uPIWuAJS4NFFFwkYLUUU769c+NzZqsZ1fXFgHlYr7i7QckQDQtQLnLfhwQCgREIvj9m.lS3WIzMLvXiMVz50QUUEM1XiXgKjYsnPIm+wI94UhHWJFTF.DLSYNFFPhsr4sfthjYLEEU7AePLYFCLiXDQD4LwfxPQYIpP.XhImDxD1uI0Mzw8Ga73xLVCMz.yLVQjbc4.vOuRD4VwfxnhRRoDacKaAc0UWwc6JJJ3C9fOfYFqDFG8RhH2JFTFUzXxImL5tCgttdb0JlEUUUTOyLVQKQz+vYxA20IhbAXPYTQAyLisUb8abc.L0rnrs1ZKt1ID.0UGyLVwpXWNTysOK4niLiJiHp.hAkQELSL4DQWrMMLLvXiO0JhNqULGJqMpibnb5gmErFQTADCJiJHLLLvV2xVwMtwM.fYsh86+8+drjkrjnoaodlQLmm7PpxDbPFIhbozxOC2PQtR9eATXLwjSFMyXJpJn7xKGUWc0wb+S..fJpnBnnnTP5iDQDQ4KZLdDvgrn.PQQAG8HGA555..vvPGO+y+8P2c2cbsSUUEm5TmBs2d6EhtIUDhebkHxshCeIUvj3FOevfAil4LKpppXrwFC974K5swLmU7JebQd4xmCdQpDQERLnLpnwQhIyYVz00wy+7OO5omd..fhpJN8W7El0dFUzIeruWlKyTF22NIhJjXPYTQiDyblkfACFMSYppJSKyYVpnxJfhfYPqvJ2O3hhbbXYDQTgfDLnLpnmDG8HGE5FQp8Lcc7be2uazLmYQSSCewo+Brj1XFzb+X1rHhbmXPYvbAIkJVIPc0GaFzjHXvfXhIlHtVopphwGa7oUSZBAPkUTEDJ7E47Gm7BUFQDUXH.CJC.49MPYJaRficrikzZO64dtmC81auws.lpoogyb5SiVSXmAfx9LjFPJkN15xxPZ.CoQgtaPDUBiAkAvQCwgIY0dlTJQnjjAMMMOXrwmdFz.DnpJqjYPKKQHDnlpqAdz7BkbcpmyAGdq9ullFDL04DQEHLnL.HXlxb7DBAN1wOdRyf1y9rOK5qu9h6183wCN8oOCZs0VxmcSWqpppJ7Ue0WAoThZqs1Bc2YFq1ZqEm+7mGBgHtEvXhHJehAkAVhJtEIKCZFxDpAsHCsoGOdvXiMVbYPqppphYIYVRHDn95yOaKV4hOuJDBzPCMjCNxDQj8wfxHWMEg.e1m8Yvvvvr3AiDzUnPgvy9rOK5u+9A.fGMMblu7KQKsvLmUrigMSD4VwfxHWujlAMCCDJTnnYPKYYNyByfFQDQ4CLnLpjjhhxTYPCQxb1teVz+.8GW673wC9xu7KQyM2bgnaRIEK3.hH2IFTFUxJ1LnYXniPgMybVLqnFvqWu392+9XdyadLiYEIXHYDQtULnLh.fhhJNwINQjZOCQKbofACgctycfgFZH7Um8qPqszZAseR.BVUYDQtTZw78OktJ4+EPoMe97AoTBud8Ns6SUUEABD.986mKxvDQDkSow3Q.GOjRX555XCaXCQ1KMicfKM4wiGb3CeXzTSMkxMLcJ+hebkHxshCeI454ymunEzehBGNLlbxIge+9S58aXXf5qudtFVUDgWHIQjaECJib0zMLvF2zFQ22r6jd+ZZZ3vG9vod1UJDntErfbXOjloXlxHhbqXPYjKiD97MQzLioqqiImH0YByiGOLSXNLBFVFQjKjDLnLxkIbXcr4MuYzc2cCCCCnppgCe3+0jrR8aV+XBg.0xLg4vvAvjHxchAkgn67NjKwsu8swHiLBpnhJfGudPc0wLg4pvDkQD4BI.CJC.fK0AtLVKvqG+3eFZu8kvLgQDQji.CJCfiFhKU80WGpu95KzcCJaiedkHxkRoP2AJFHXlxbkR0xfAQDQTwHFTFXIp31HR3uI2E94UhH2JFTF4Zwu71chAaSD4VwfxHWGqfw3WdSDQjSBCJiHxgg4.kHxchAkQD4nvPxHhbqXPYjqi0vVxu71cRvAllHxkRgewEXwG4xv2SSDQjSjBiGA7awIxAgebkHxshCeIQjiBuPRhH2JFTFQjiByTFQjaECJiHxQQvvxHhbgjfAkQD43vAvjHxchAkA.AOGOQNGLQYDQtPBvfx..fjmj2khQaSDQjyACJCfe2sqEi11UhedkHxkhAkA.A+tahHhHp.iAkAlOE2FQB+M4tvOuRD4VwfxHWK9k2tSLXahH2JFTF45XELF+xahHhbRXPYDQNLLGnDQtSLnLhHGEFRFQjaECJibcrF1R9k2tSBNvzDQtTJ7Kt.K9HWF9dZhHhbhTX7HfeKNQNH7iqDQtUb3KIhbT3ERRD4VwfxHhbTjLWYDQtTLnLhHGEloLhH2HIXPYDQNNLrLhH2IFTF.D7b7D4bvQujHxER.FTF..j7j7tTLZahHh9+u8ty9sMy1Wyu+rdI4Kkjmz7.kjkjmpAaWCafSepxCxtbU0I37mQtoCP.RtoafFH88I.IH4t9DjDf9hbem6RBBvt1UeNUUmCJOU0dWtFrslmGrF8tr4zKW4BJRSIKNHZRy2Wpue.1trkW7kuRaZoG9as9sVAGDJShe1cSKRa2Th+8J.ZRQnLIY3mcC..fFLBkIpmRyFyA9un4B+6U.zrhPYnokwgWd2rvwwQYxjQYxjgJaCflVgaz2..0Z18JQ1Naus19LmowdyfZhm+7mq1aucYsVY3vgC.MoHTFZ5X1ahKu9MtgbZBqVVtOmxjISC9N4smScpSou669N0d6sqSe5S2nuc..pKHTFP.h0Z01ausjjN4oNobLMegNOLFiQczQGDHC.M0HTFZ5jwySRRe629sZjQFoAe2TaEOdb8ge3Gps2da8f68.0ae81nukdqvXL5Tm7TM5aC.f5pvVQWpwW.Ztbl1aWsu6tpyN6Ts2d6M5amZpDIRHydUGq8NZuo6yO.fiyBSdDQO12DIb3P5a9luQVqUm5TMeUVI65HyVvuG..MKX5KQSFCq6H..DHc7XUBC...3yQnLf.GVzA..MiHTFPfCKBR.flMVQnLIIYnvC...nAxHBkIIIKEd.AR7BW.flIDJShknCBjHRF.PyEBkIIC+zMD.Y3cS..zTgPYhJNffIdcK.PyEBkADPQcx..ZtPnL....e.BkA...3CPnLffFl2R.flRDJCHngU3O.PSIG996hJO...fFNGxiHp7....Z3X5KA...7AHTF...fO.gx.BbXQG..zLhPY.ANrHHA.Z1XEgxjjjgBO...fFHiHTljjrT3ADHwKbA.ZlPnLIVhNHPhHY..MWHTljL7S2P.jg2MA.PSEBkIp3.Bl30s..MWHTFP.E0IC.n4Bgx....7AHTF...fO.gx.BZXdKA.ZJQnLffFVg+..Mkb36uKp7....Z3bHOhnxC...ngiouD...vGfPY....9.DJCHvgEc..PyHBkAD3vhfD.nYiUDJSRRFJ7....ZfLhPYRRxRgGPfDuvE.nYBgxjXI5f.IKuvE.noBgxjjgBNf.HhjA.zbgPYhIABAS75V.flKDJCHfhJkA.zbgPY....9.DJC...vGfPY.AMLuk..MkHTFPPCqve.flRN782EUd....MbNjGQT4A...zvwzWB...3CPnL....e.BkAD3vhN..nYDgx.BbXQPB.zrwJBkIIICEd....MPFQnLIIYovCHPhW3B.zLgPYRrDcPfjkW3B.zTgPYRxPAGP.DQx..ZtPnLwj.gfIdcK.PyEBkADPQkx..ZtPnL....e.BkA...3CPnLffFl2R.flRDJCHngU3O.PSIG996hJO...fFNGxiHp7....Z3X5KA...7AHTF...fO.gx.BbXQG..zLhPY.ANrHHA.Z1XEgxjjjgBO...fFHiHTljjrT3ADHwKbA.ZlPnLIVhNHPxxKbA.ZpPnLIYnfCH.hHY..MWHTlXRfPvDutE.n4Bgx.BnnRY..MWHTF...fO.gx....7AHTFPPCyaI.PSIBkADzvJ7G.nojCe+cQkG...PCmC4QDUd....MbL8k....9.DJC...vGfPY.ANrnC..ZFQnLf.GVDj..MarhPYRRxPgG...PCjQDJSRRVJ7.Bj3Et..MSHTlDKQGDHY4Et..MUHTljLTvAD.QjL.flKDJSLIPHXhW2B.zbgPY.ATToL.flKDJC...vGfPY....9.DJCHng4sD.noDgx.BZXE9C.zTxgu+tnxC...ngyg7HhJO...fFNl9R....e.BkA...3CPnLf.GVzA..MiHTFPfCKBR.flMVQnLIIYnvC...nAxHBkIIIKEd.AR7BW.flIDJShknCBjr7BW.flJDJSRFJ3.BfHRF.PyEBkIlDHDLwqaA.ZtPnLf.JpTF.PyEBkA...3CPnL....e.BkADzv7VB.zThPY.AMrB+A.ZJ4v2eWT4A...zv4PdDQkG...PCGSeI...fO.gx....7AHTFPfCK5..flMVQnLf.HVDj..MiHTljLT3A...z.YDgxjjjkBOf.IdgK.PyDBkIwRzAARVdgK.PSEBkIICEb.APDIC.n4BgxDSBDBl30s..MWHTFP.EUJC.n4Bgx....7AHTF...fO.gx.BZXdKA.ZJQnLf.jvgCKydoxBGJbC9tA..0Rgsh23MeAn9Z4kWVoSmt3CnHuHbfAFPgCG90F5JG75UpWDaLZf96+0tNu1sf0pkWdY444s2iSJV+wTnvgJ4iqdwJoshakWFqRr0JxlI68U73wU5zdxZsZt4mSwSDWCLv.JTnFy8I..pcBSdDwdKPcTlLYzm8Yeld5SeZ9OV3PgNzy1JOurgMjjBEJj90e8W04O+42+0yySiO93ZpolRRFIiUgbBISAWuBuNgiDQO929MM5niV160ae6aqYmcVIIEIRD8q+5upgGd3i5mx0DVI8e2+RFs51+t9p+q9Wo3atb9+tTdYjjze6+p+F0VaspImZF0c2c2PtOA.PsCy+Ap65qu9zu+6+d9+7JKurRmqhTEn+9yUYLqBEJTQqtUe80mhGOd9+79pvkz9pbT3vgUnC45bvJikJUJ8hW7BkLYRIIkIiMevt2F1ekwVVIR4osVNo1c2DxbxtTHqI+4AV38BfZkUNQip4leA8xW9x8tRF0Rm8KmPgTGQMxg20E.PfAgxPckiii9i+w+X9.NYxjQu+6+dZ5om40F2e5O8U6qxXQhD40tdgBERe8W+04udddd5xu+6qom4UWuu9q+ZM1XiUxqS5zo0MtwMxWYrb2au594n844ap7UFamWnu5e8eqd4lKKOqjSjVzm+e3GTqcEK+TXlmwHuDuT25K+XkX6UkjTnnsou7+ieSs26.5e3yL5jLql..AFDJC0cEFJxZsZ3gOqRm160VqYtttx008Hc8xjwSxjMAUrXwTznQ0INwIJ60wXLpu96K+y+AqbV8tFYVY0Vwk7xXU7sVVoR4osVJo184wk4jcqvVihHoPQhpPtsHmvQk0t+PYFYjxjQgauOk1jM8UnHQ0yWaAozw0LSGQs2hCq4L.f..qHTFdKyXL5O9G+ixyySu268dZl8pvkQRgbN5AGbbBIOurAq9S+o+jFarwNzJicPgCGV+S+i+S4q3VpToz6+9uulat4xNf5bpLq0n+8+KdZkcdg9p+0ehd4lKIuLRNtQ0m+e3GUqcMnrYx94kSnH4+866ZHqbhDUi++3+njrxXbT5DuPe0+0ejRr8Z5+WGo1ZqMM0zynt5pq56mP..3MFgxzgtlyQcTjHQT3vg0YO6YkWlLZ4kVR1LYz7yOubBGRwNjtt70Y0RKsrRjHoFXfAjjzIZq7UH6f2G4Xbbj4svBvJ2ZGKdZq1dk4zt676x4TcovVsuJiEJhqxjYuPpkYss4DYuOmMFExySQ6reYBEVVIEpknZ14mWu3EuPwhEiJlA.3SYDgxjTY+YdnNnvJlckqbEM4jSpO+K9bEJTX8q+1upQGYjxcEz3iOtldpoyN9QGshpPVQYs6q5X0qf5oyr2ZGa2Wp++9u8lJw1qou3+0eRs08PYmJVI4DNhx3UXkwLpjktK2KfsVYbipa8+z+njM6WiSm320MuyGpPI+qZ5YmiJlA.3iQnLI1mxZPxUwrbamEoRkRdo8z7yMmbLFEKVrWuhYVokVdIkHdB0UWcojISpVassiTExpD0sb5Vqd9pypc25Ex8zcKSnHJjaqxD1UN4VyXu16Rn72M41p1LRxDN6WKLFiBkwSgae.EJwtZ14nhY..9YDJSRFpTVCiMiceamEYrYzm+4etBEJj94e9m04N241+Cvn76SY+5u9q5bm6bUvTcVM2X09Kojj7Rp+o+c2QKsxZ5K9G9A0ZWCIiiYeqYrpYCctvwas1r0VylcMm8Y+u7Mx6kuPi+k+AEJ4y0SmXB0au8VC9jA..0RDJSr2w1PYjFd3gkmmmVZokT5zoyVwLOOk4.ULZokVRIRjPc0c2JYxjps1Z6MaJKK4skol95hbqkrWDOiRmJoxjNobBEI6ZGyK89RhUUEtsDOdmvtJSjTJYpjJTpD75c..eJBkgFpb6iYYxjQu669tupaLMFEofoXyyyS24N2QSM0T5QO5QZrwFq9Tgr8TqCtjesjsim19kdRY7jrErA0lKIUYV9XEUId7VqM6ThlwSxKS1STA..36PnLzvEIRDYsYzYO6YUlLYzRKszdmsiyKiiihEKlLFiRlLoRkJkBGNRcqBY4ja8YUyXsZ28VKYszULEpkSHygcfh+llFrXOdiQs06HJTxmq4laAVaY..9PDJC9BFii9pu5qT5zo069tumlc1YzctycT3vQzie7ukOvljj0loLWspwARyTiWngFuj5a+2cGs3xqpu7e3GUq8LjrFmWeW5udvZUnHspa++72HuW9W0M+hOVgS+65IOk0VF.feBgxfuQ3vgkiiiFYjyJqMiVbwEUxjIxeTHEKV18ir5SUxpOsfqURaF2pWF2pT6sVxLgijccd4cvMD1ry8XEMClGZ2.ThGuI6lPalHtJYpTJSpjU0mO..n9gPYvWww4UUL6xW9xZpolZuJlEV+4+7ettuVxxqFUnrzYj92+ujQqtSZs0K8jrYxtVxNzm.aoepKLH1glgrzOdalrqsLiwjeaHA..9Ggql1uuoyw9u.3ujqhY4BNjNcZkISFENR8esjkSMaxKyuuj86p0tFTga4jx3D5H7DTPcuppWmV3iufK.sfI.fuSXxiH9AT9PNNN6a+KyXLJjiyauafZz+vHS5r6KYEtVxLGo0RVsek+ayjV1LoYQ9C.3yvzWBemEWbQkHQBEKVLYsVs3hKlsaL26vBevAGr9OEl0vf51zojMUR4r2ZIy9Zqkrbp18CiJ8wakjiZq2QUnj+UM67yq+5e8uVjws+ToV6qWnshma0e83s68K73q+O9PgBoAGbPldbfpDgxfuhmmm97O+y229Q1Eu3E0ryNa90V1ie7i0YO6YqoOuGLJSM8moXxdAsk8PVsdseXj6u1pPQaIaWXF+203e4ePI2YckNcwBIBbzL7vCqomdZBkATkHTF7cRkJU18irHgUjHQzH6c3juvBKnjISpYmYVYs1ZZEyN3OBo1Oi1UxOj5McEdVYOdmvtJSnj4+57PCMzdSkYk83yOpWa373Od+3k5omdzTSMkZokVnhY.GQVQnLIo7qcoxWICTuEJTn76GYY7x9ey2Mlu+6qoldZcmOOaEy9ke4WzXiMV84Fol+RAaEbceS+AXU1iO6qyydZBzVqsnu+6+d0SO87F9bCj8MN8du66oAhESO9w+lbccaz2R.AJDJSRCO7PZqs1RQiFsQeqbrVgqkLoWsejENbXYNP2XZsYBLgn2+tXge4d1l+9JxawtZEM2hDIhRkNoRw9fGvQlQDJSRR+m9O8+krV6am8+JTT2912VSLwD5W+seSm+bma+++GVqR6UXGKZpq++W0xYcIcZOIqmjSHYBGV1TdGwrY01F.vDJjLgBmcsjkNcfIbK7+rrO3A7FgTHRDFqAagEWTISjP8zSOJUpTpsVa8PqbSt0VVttwblYlolu1xxoVESwXLZzQGUQa8DJ4lKJqWJ0Rm8KiSjivyRMrA.rV8hUmQdu720niLhhZiyViApoHhOP0izHng6K+hOWSLwj5QO5Q57m+7GZHgPgBkcsk4kVuykdGM2byk+rw7oO8IZ3gGt1dSUi9IKttt5a91uUIhmPu668dZwUVW+W7+9iTq8NrrdG9dUVca49abjWh+p9O+u4lJbx+pdxSdr5s2d4Mk..3Sv2MFMLKtvBJQxj5Eu3kJc5zJb3vkLfPtc5+QGcT43XzBKrnRkJolYlYjmmmFZngpgciool8N9CGNrx3lQ1Ldx5k5vutEjjppBjcDd7Vuzx5kRQBGg.YnlyXMbHo.Tk36HiFlu7K+R8zIlH+9jUlLkOFTtyFSuzo0689uuld5oyu+k8jmT6pXVsdJXrVa1cweqmbbBIiSj8WorB6Ffp4IuBd7NgBoLgBk8q2ddJixTEOQ.kl0vTXBTsHTFdqK29M1KdY1JjMzPCIWWW45VYc.X3vgkSAKl3z6sX0qkULynZ7QhpQps9FQsZaSubiEj0Kkh14.YOGLKT8Z+i0Z0uuxzJS7eWiM5Hx0KtBEh+4OpCrbbBCTs36Ji25969696zSe5SkmmmbbbzW+0estvEtvQ5Z3DJz95vKOOu2nJlENbXsuIcwTa6FWmPQ00+e3OoU14k5e5+lOVI28Y5K+e6mUqcOTkcNX9lrPyLF4k3k5+7+1aoPI2UO8IOQ81auJTXVf+..9IDJC0cKrvBJUpTRJ6z3kqBYRY6NwEWbQENRDMXrAUjHE+kjEdcx34k+2mSgULqvq+gU4Lq0pEVXg7iKc5zJU5TE72KM8zSqDIRTxqSkxXj5+ztxw5Ii0SYRmRGxg6jxs+g8ZE75vNxAdsPZk3wKqrdIk0KUYW6d.uYrL8k.UI9NyntJSlL5N24N5oO8oE8u+1291xwwQO9wOtnULyyyS25V2RSM0Tk74yyySiO934+ygCGVO8oOUiN5n6aboSmV27l2TyN6rG50IUpT5F23F4+yttt5oS7Tc1gqtybyvNR+2esHJdhL5+mPd5EY7jwIjLghTPkxrE7qGhBChcnUM6ve7lPg2aeIKiroyvOxD0UL0k.UuvuoseOP4L3fCtupZcvMVRq0JGGmRVkLIogFZn7GASG10ovqWNgCc3UEJWkuJ7Zj829p+bgWmHQhnvugqAKGS1vYiM1Xp0SbJkXiETlzoTKG1ZK6U2UJeLqp4endv0RVlWpPN7dwP8CQ9ApdFKam2ntxJOOOUIuJKzAVmXGT1qyQ+kqgBGRGVS5eTud0lo7yJOuLJ9KiqyewKnUW4Y5u++yIUacOrxjI6ToZ8R+F8LX1K7nw3nzw+c8+8+kWPghuilZpoTe8laYy9A..f.PRDEDU0GScIpale940niNphEKllbxI4ruD3Hhu6LpyL0rt7qVuyy2X1I6MJTnPJhaDM1HmUs15IThmMu7RFWxlsJfs18PknxYk9ZKaF8hUlN6ThZbTljuTiN7fxMcGpkVZg.Y..9X7cnAZ.bcc029c+y5ku7k5BW7RZ0UVN6eQ3n5u++3SUq8Lnjm29lJnhUAsWUYLiRG+E5q92LtRuypRRJZKspImXB0Wery8C.32w2kFnAITnPx00UiMxHpsViJIImvtJwylSdIeoTgaUFFydUPKrN3YY4uuxzYGqwnLIiqQGNl75rUII0ZKspVZIJAx..74rhPY.MTttt5a9tuU4VzcwiGe+UNKmvsn+9+iOYu80rba2GYWyXe8+1wUpseUkwlXhmp96qu8FiXg8C.DPv2sFnAKbAqsM2HtZrQOqZq0V12XbB6pjOaNkI4KjMWGnZLJSpDZzgFTo6nMII0ZqsnVhRkw..BZLhPY.9JQh5pu8a+tWqqPiGOtN+EtnVa0U12G2MZKZpIdp5q+9y9ALl8ExC3ssRz.0.nLHTFfOhQGdWgFIRDM1ninSzVq66i2RKsnnzUkvGg8XIfpGembf.fnQipu669NIcfSXIq3LrD.nIAgx.BHZL6qZ.GMF6gsUMCfJgSi9F...MOrFlBSfpEgx..PsikySYfpEgx....7AHTF..pgrL8k.UIBkA.fZFl5RfpmCuiF..TqvOSAn54v6pA...nwiouD...vGfPY....9.DJC...nAyJBkA...3KPnL...fFLiHTF..pgLzR+.UMBkA.fZF1mx.pdDJC...vGfPY..nlwXMbTKATkHTF..pYrFlBSfpEgx..PsikCkbfpEgx....7AHTF..pgrL8k.UIBkA.fZFl5RfpmCuiF..TqvOSAn54v6pA...nwiouD...vGfPY....9.DJC...nAyJBkA...3KPnL...fFLiHTF..pgLzR+.UMBkA.fZF1mx.pdDJC...vGfPY..nlwXMbTKATkHTF..pYrFlBSfpEgx..PsikCkbfpEgx....7AHTF..pgrL8k.UIBkA.fZFl5RfpmCuiF..TqvOSAn54v6pA...nwiouD...vGfPY....9.DJC...nAyJBkA...3KPnL...fFLiHTF..pgLzR+.UMBkA.fZF1mx.pdDJC..0DQhDQRFYLl898.3nHbi9F...uckNcZM0jSpL1ZacsVYkUjrVkJUJ8nG8n5VvrHQhnyctyICyUJZxXr1Z7+pD..9Zqu1ZJVrXJsmWi9VopL1Xiom7jmnvgotBn4BuhF.3XhzoSqImbRswFan268eekJUp89arJ2QI9q9cGEU2i5vd7k5JkJUJM4jSJpk.ZVQnL.fiIVes00Uu5UU2c2klbpoUqszR1+BqMeaSdvPQVIYx8A26+9ZAmdK83mY5YzXmarp7yd.+OVn+..GSX2Ksi0dfPQEr1rNXUpLE9AMG9Xda+3AZVQnL..DHvjVhlcN7hb.fiGB5EZJne+CTNN7hb...fFOl9R.fiMB5yMRP+9GnzHTF.vwFlB90fnf6cNPkfPY....MXVQnL....eABkA.bLCqLK.+GiHTF.vwTDMCvugPY..GCYYQyC36PnL.figHRFf+Cgx..N1vdH+tfjf4cMPkhPY..Ga7pSD7fYkxBl20.UpvM5a...7VxdEZxDTK3za38cxjI0DSLQs4dQRttt5BW3BuwWmDIRnImbxxNtnQipye9y+F+7A+KBkA.bLi8XZAmlat4zku7kqYWuKcoKoG+3G+Fecle9J695xW9x5QO5QuwOev+hPY..GSjOLV.sRYuogIiFMpt5Uup777jzqW4LWWWcgyegxNKo4dbIRjPO5Q+rbbLRxJW2nGoJmkqBYURUxjjhmHt9ke4WTT2n57WfJl0LhPY..3XggGdX8W9K+k7+4ImbRcoKcIkISFIIc1ydV8nG8HYbJcprm7jmn24cdGM6rypqd0qj+i+Nuy6ne629sJ99Ypol5HU4tImXRc4KeYc4qbY8nehJl0LJrUrzIA.NNHn+85qK2+G3hZkUlx7LEMZTc4qbEIqUVqceUN6m+4eVQiFshp31qtd4VaZlrUw7.OtDIhqIl3UUSKQ7rOOszRKrFyZxDNn+ORA..pFVa0MOtiLxH5Q+zOk+OmqxYyLyL5JW4JUbEyBGN6jUM7vmUO5Q+bQG2u7K+rt7keUE4lXhIzUtxUzku76WxGGBdXKw..3Xi.5hIKuZ88uQEVVppsHEttt5JW4J4WOYIRjTO5QORSLwDG5cbtJpM8zSqKe4Kq268duRd8iFsEc4Ke4CY8pQYUZ1vZJC.3XCSA+ZPTs8N2HIYey2PcGczQ0O8S+jdxSdhd228c0LyLst5UuptzkdG8a+1uJY1+88zSOc1Jp8tuq9se8WK60+7m+75QO5Q5W9keol18nv+gJkA.fimpwoSO3zgZJx0O2vNpO8U4rsh.BqHTF..NlpVmwwt2B+OGiwHyglLK6XRkJ0Q8Yn5u4Pf.gx..Nlgez9drEuZVUiVZoEckqbEcwKdQIkceE6QO5Q5oO8o6abQiFUW9xWVu+6+90tmbD3YDqoL.fioHZlLR1Z3wavqs1xldFc0qd0WqaLO24NWMYm4Oc5iZk1feGgx..NFxFfWt+0Jl7+Rs0qu1xpsOIQiFUW7hWj8nrlPDJC.3XHhjorSe4asJFV61p1uvEtf9oB1mzPyCVSY..Ga7lu8OzXUauqslW+RFL+5BZVPnL.fiML4+OAyJkU62mxNXHr51WWpAo8xcB.bz6ZSDTvzWB.bbQt8GqCDPHc5T5wO9IU8wNT8VD2H5ctz6T6uvVsuy4RiodVorpOtWhDIzSe5S0BKrv9N4.PyGBkA.bLyAa3vUWcMc0qdUeanrXwhoEWbwZ900J699ZQsaUecHdCtvyM6b5pW8p58du2S+xu7K0t6I36PnL.fiIxG.4.YuhDIh9C+g+fRjHwgNkdUFiRkJodxierBGIhtzktzQrqCy9LeXO+CN3fU0cT4eJM6eax2mkIMWExlbxIkTsuKNg+Cgx..Nlq2d6U2+92+M95rvBKnQGYD0We8oe7G+w7qApZk5wwQ9aKUSU3lbxI0Uu5Uy+mSmNcM8dB9OgqqkqE..9F06uWu0ZyGbJSlL07qes992Zsu09AfuIOMQiFUW5RWh8kriABSfL..brT0OWskTjHQ12eNcU1sjgCGRRRib1yp+xe4u7FeeA+Ol9R.fiM7YKZpir5vDXVv5z5MsHEIRjPO4IOQyLyLR5UU3ZrwFSGkIvL20YwEWTW8pWkJjcLBgx..N1vTvuFDUi2mxrZeKz+2zHeyLyL5C9fOH+edrwFqppv0ryNq9fO3CzEN+EzSm3ok+AflFDJC..GOUGRmZLl7asHVa1+Wk1zjIRDWO4IOUKjuBYmq1eCBeKqHTF..NlpVOYnGbsjkJURcTl1xYmad8AevGnye9yqIlXhZ7cGBBHTF.vwLA8UVVMyQnJVkRt0.1zSOsjJbsjM5Q5wmaMjctyU5JjEOdb8zmlcZMsRpk8d9PvlQDJC.3Xp5Szr.09apQxdvi2fpvRKsz9VKYCN3PGo0R17ymsBYU5N1+byM69d9t3EundxSdxQ6lF9RDJC.3XHacZ49GjpBmI+ubzjHQB8jG+37etN6ryJiwHWWW8Nuy6nQGcTYs1xtC7mHQB83G+37UXKd735m9oeprG2USNQ1c3+nQaQW5RWTW7hW7n+IA7kHTF.vwPAoBZUuDIRDYJHFowXjiiSYebKszR5C9vO7093CN3f5O+m+yU7y+7yOu9vBtNSO8z6qBXkyEtvEX+KqICgx..N1n9WGKSMX5.Kt2r6+jISpe6wON+1fwbyO+9N5KSjHg9w+7OJGSoClcvJikyQsBYSM0TU+mLRxXBR0kDUBBkA.brgYe+m5g5Zlr2va74laN8gknRTyM2b5i+nOthudwhE6HUYrblZxI2WExpVISVcmT.v+hPY..GWrWgUpqEXoddbR9FdeGMZT8wezGIuxbtbVom9RiLxHUTkwNnVZs0RNMk4tZ1x7AYm9u4Cgx..Nlo9VMK+qgGdX8ve3GZz2FZrwFqppvFZ9U9UzH..ZJXOzRvTyeVpaW9iqgIwwGDJC..0LjaBn54Pua..b7vai.S0yelBA9PyNGdQN...PiGSeI.vwFA84FIne+CTZDJC.3XCSA+ZPTv8NGnRPnL...fFLqHTF...fu.gx..NlgUlEf+iQDJC.3Xp5Szri3IND.J.gx..NFxVmVz7TENfpGgx..NFhBZA3+PnL.fiMp+0wxTWi6Qc3PyMBkA.brgYe+m5g5arIpuGZtQnL.fiK1KwjodlbxVGiNQgxPSNBkA.bLikBNA3KQnL.fiIxGFqtVwIac6xSXRzriPY..GWXsJUpTJYpT0sfY00bS1r2zISlrd9r.zvD1JV5j..GG35FQ+M+M+M5Lmoc4Dp97dxqmEgKZzn5i+3OVwhESF1kZQSHi0ZYoSB.f2XyO+7ZzQGUwhESSN4jx00sQeKADnvzWB...3CPnL....e.BkA...zfYEgx....7EHTF...PClQDJC..0PrSU.T8HTF..pYXOVBn5QnL....e.BkA.fZFCmQL.UMBkA.fZFl9RfpGgx..PsikySYfpEgx....7AHTF..pgrLEl.UIBkA.fZFl5RfpmCuiF..TqvOSAn54v6pA...nwiouD...vGfPY....9.DJC...nAyJBkA...3KPnL...fFLiHTF..pgLzR+.UMBkA.fZF1mx.pdDJC...vGfPY..nlwvAsDPUiPY..nlgouDn5QnL..T6X4PIGnZQnL....e.BkA.fZHKSgIPUhPY..nlgotDn54v6nA..0J7yT.pdN7tZ....Z7X5KA...7AHTF...fO.gx....ZvrhPY....9BDJC...nAyHBkA.fZHCszOPUiPY..nlg8oLfpGgx....7AHTF..pYLbPKAT0HTF..pYX5KApdDJC..0NVNTxApVDJC...vGfPY..nFxxTXBTkHTF..pYXpKApdN7NZ..PsB+LEfpmCuqF..TK355JIIiwj+2CfJW3F8M...pMRkJk9ge3GTlLYZHO+qs1ZRRJQhD5a9luQQhDogbebT0RKsnO5C+Hl6UzvYrVKUaF.nIvFarg5t6taz2FANwhESKt3hM5aC.pTF.PPWpTozCe3C0N6rit4MuoRkJUIFsQISlT+vO7PENbD8we7GKmxrPVxN9ePQhjc7FiiNrUOVxjI0Ce3OHW2H5i+nOVlC85l6iYUhDYuOhFMp9nO5ijoHml4IRjP+vO7C6MtOduwU75Ir+wevq6qd9yo6t6V+y+y+yps1ZSezG8Qk5KE.0MVQkx..B7xUgrSdxSps1ZKENboe+16ryNp81aWc0UWZ0UWUgBEpjieqs2Vc1QGpmd5QqrxJxw4vab+M2bS0UWcod6sOsxJKWzPV47rm8L0SO8n96ues7xKWzws1Zqo95quJthVqrxJZfAFPCO7vZt4lqriewEWTCMzPZfA5WKrvhE8yOf5IqnRY..AVEVgrqe8qqyblyHOOuhFJK232d6s00u10UGc1g777JZnrbUHaqs1RW6S+T0U2cKOOuWKzR1Jj8Ps0VaoO8S+T0SO8nzoSWz0TVtJYs0lapO4S9D0e+8qzoS+Z224F2Fato9j+1OQCDa.k1ySgKx8a7DIzO9C+fd1ydl9jO4SzfCNn7xjQgJRHq3wiqe7G+Qs95qqO4S9DMzPCcniC3sAinRY..AVKu7xJ1fCpN6nCs1pqpPkoBYKszRZvAGrhqP1BKrfFd3gUO8zqVc0UJZkule940YO6YUe80mVdkUJ65ke1YmUiN5nJ1.CnEWZohNtomdZctycNM3fCpEVXgxbUklbxI0EtvEp3Jj8zIlPW5hWTiLxHZlYloriGndiZzB.DPkcqmHhhDIhRVx0Q1qFejHGswGNbXEIRXkLYxhONYTnPgTjHQTpRLtBGuiiQgiDojq+sbg.CGNrRmNcEc+la7dddkc7NEL9FUGqBTHBkA.DP455pjIRpDIRTQaZqQbcUpToThDIpnc4UW2HJc5zYGeottQiHOOurA2pjqaTWkIisjA8jT9o+L63J+E10svwWd6+5Cz3wZJC.Hf4UqMrczMt9MzYZ+LEccSI8p07Ut0dVGczQIWL64Fe10d10Tmc0sbLu93Kbsjcsq8opmd5sHcbYVIRjPO7g+f1ZqM0m9oep5qu9NzoDM63dn1bu0b1.CDauN9rTW2GpM2Xi7qkLUhlLHd735G1asm8oe5mlc7.9.rlx..BXx0kis01IzN6rkBGtzaRq45xwScpSos1ZqxtVxx0sim4LmQat0lGZfLIoUWcU0e+8q1aucs4laV1tsb4kWVwhESc1UmZimsQQG2hKsjFZvAU2c2sVe80K40TRZ9EVPmc3gUu81qVc0UK63ysl1JWWeB71FUJC.HfHUpT5AO3AZ2c1Q23F2Pm9zmVdo8JZnr8Ugrabc0Q6kuaKyUgrqc8qot5rKkNsmbi75ca4CdvCxNtqcM0S2kuaKKr6L6qu9JZ2V9vG9Ps4VasWExFPddoUnPG9OpJ232XuJpksaK8THmhzclGRExxjICaAFv2fJkA.DPrxJqnXwho1aucs1ZqU18iriZ2Vla+5pmd5Qqr5p4WH7GTttsr295Uqrbw6JybxWYpA5WKuTwqL0LyLiFarwp38irolZJc9yedMzPCo4me9xN9IlXBcwKdQc1QFQyR2VBeHd6A..AE6cPeGIRjJZwouutsrhFu1qaKKcWTZL60skgq76CGGmriOUottu5dtzmJAu55JkcA6eT5NyHUX2YB71Fgx..BHbccUhDIThJraAcKraKqnwGMe2VVpoPw008UcaYEdejISFkHQRUpS86HQbk0V9tx7UieutmrB+7K23qzu9A71VXqJ0+DA..MZ4VKY4NaKO8oOcIWGToRlTOXu0F1MtwMT6s2dY61xG7fGns2q6L6pqNUnCqqHSlTObu0R10u90U2c2cIutEtVxt10tl5s2dOzoDMQhD5AO3A4WyYCLP+kbJQimHgd3Cdf1byrcwYrXwJ83iGO6ZOaiMzm9oepFZngJ6TtBzHvZJC.vmaqs1Rc1Ymps1ZS6ryNkcsjswy1Pc2S25Dm7jZms2trqkr0Wec0au8pSepSos1d6hFzJW2VdlybFs0VaU1fM4NCJ6ryN0FaT7tsrv091yd1yJ40TpfSZfd6Qqs5Zkc7yM2bZjQFQ80WeZkUVoriGnQgtuD.vm5vpP1g00huZ7I08u+qF+YZ+LJc5zkraKeP9JecC0UWcpzoSKWW2Ccbas0V4qPV461xGns1Z67UHKUpTu13KrBYW6ZWqnmAluZ7w0CdvC2WExJU2j9ZUHavgnaKguFUJC.vmZkUy1skm4zmQqu95ksBY42Gv5rSs1ZqUwcaY2c2sVc0UKZXkbUlp2d6UqrR461xWUYp90JqT7tsb1YlQiN1XZfAFPKUhy.ybNpmElSL4j5hGgyBSfFMd6B..9TFYjaDWEIhaks32y0clt01tyLa2VF9n2skkqqOMl5Z2V5Tv3oaKgemUDJC.v2JW2VlrhOqJyFdKQ7Za2YFw0UddoUhjUZWbtW2VVlw65lsaKqztCMe2SdDGOmskHnf0TF.fOSpToz8u+80t6riFe7w0oN0ojSnx28j4VKYselyTYca41aqadianN5ryCc7ISlT2+92WauyN5FW+5pqJnaKysFwtw0ut5o2dJ5YaY1wsot90tl5q+R2skIRjP2+92O+YrY1yByR2skO3AOPatwF5ZW6ZZvAGjtsD9dFwZJC.v2Y6s1VczYGp0VaU6tyNJbQVP84r4Fant5tachSbBs8N6nvUX2VdpScJscI51xbmAlm9zmQauck2sks2dGZqs1rniqv09Vo5Jybd0ZeqGs95kuaKychCzWu8oUVktsDAGToL..eh7UHa2c0sFebcxScZk1yqngxRlLot+Ctu1cmc0327l5Ls2t7RmtngxxU4qbUTqiN5nnca48u+8yuOm0UWcUxtsL232Zqsz0uw0UOc2Sw61x6+.s4dcwYwNCLKb7upBYWSwhU5yBy7UHayMyWgrLY7jSQNKLA7anRY..9Das8VpyN5buJjsqBGozuu4M2bC0UWcq1NwIzt6rSY61xm8rmod5oGcxSdRsyN6TAUH6zZ6s2trUHK29WV6s2t1ZqsJ53xUgrN5nCs4lEuRZ4jqBYU59WV9yjyd6Uqt5pkc7.9MToL.fFrbUHamc1Q25V2Rm7jmTo8RWzPYoRkT26d2W6rytZ7aNdEsejcvJjkJUZEMZopP1MyuukUz8irjIz8u280N6UQsd5o3UHKekzt9MTe81SEUgrbU7ZfAJ+9QV1Jjsgt10ttFbvXxKSFEh8iLDvPkx..ZvVc0UUrXwzoN0oz5qudQCAkyJqrhhMPL0d6sq0e1ZEc57xovcL+0VashVgr7qcqd5Vqs5ZksBYUZkolc14zniNh5u+90xKW78srblYlYzXiMlhEKlVbwEK63mZpoz4O+40PCMjle94K63A7q3sQ..zfY1a+EysR2ewjQtQytejk8P9tBt9Ux9QljBGNrbqv8EMiLJTnP6sOpU7soBiQ422xpj8irr6eY41OxNZ6eYrejgfLl9R.fFrb6GYGbA2WzwGM63qj.Y4t9ISkJ69FVIlbD2nQU5zoUhDIjsB1Xzxt+k4s20s3UUa+6aYk+5lc+KSJQhjxpxuUVT39WFS8CBxHTF.PCRpToz8t28zt6ta98irPknSASlJkt+8tm1cmczst035zmt76GY26d2W6t6N5lieS0Q6cHmCYcYkcb2K+ZNqqt5pjcrXt07Ut84rt6oaYbN78irbqkrabiand6sWISI1myhGW2692Was8155W+5ZfAFH+tx+gId736c82TW+5WWwhESlJHDGfeEqoL.fFjs2da0QGcnVhFU697mW10R1lask5pyNUqs0V18urxbVXVX2Vt8NaWz.eU59VVN451xyblyns2ZaUrbP412xpztsrv09Vkzsk4NSN6omdzZqU98uL.+tvVUz+8D..pCJrBY2912Vm3DmPddEuKGyM9c1Ma2Yd5Se5R18hEV4qwGeb0d6sqzoRqPQCc3ia6cz3ieS0YGccn6aY4ruJjcyapt6takJ8g2sk26d2K6IAvdUH6v5JyCN9bUTq+9K89WVtJjsYAUHqTcmIPPAUJC.3sr0VaMMv.CnSdpSpms9ypntsL6Nke6Z80WurUHa4kVVwFL6Nl+5qudY61xt5pKs95qISIlZQoJuaKmat4zHiLh5qu9zJqT9cT+bca4.CLfVZokJ63y0skCNzfZg4WnriGHnftuD.3sLiLJpqak2kiFihFMZ9Cb7J3IPtt45NyR0UjFEIRj8ZzfJ69Ha2VV9qanPNksaOKb745PzJo6Ly2skginzoSW1wCDTvB8G.3sL2ntJdhD6c7IUYciX1tsr3AgN33SlLoRDuzAhbccUpToNRWWOOuxN9riKyQp6PsV6QZ7RRIpj.p.AHDJC.3sjBWKY2512Rm7Dmrja7qoRkR28t2M+ZO6Tm5TUP2Vdu7mL.selCu6LyMts2daM9stk5riNJ40MQxj5d28tZ6s2Q2b7wU2c08gN97qkrs2V27F2T8zaOkbCn8fqkr95u+RN93wiuuwOv.CT1M3VffBqXMkA.7VyN6riZu81UznQ0yqftsbqs1Rc1Ymp0VZU697cK6ZIaiM2Tc2UWk8rvLW2VdxSdRs6N6HSY51x7mElm4LZms2tniqv09VoNCLyIW2V1YmcpM1XixN9EWXQMzvCot6tas95qW1wCDjXEUJC.ntKWEud9yet9rO6y1qaK8Jd2VlLkt681eExpztsLWExNryByjISp6d26pc1YWcqacqrmAlknaKyM9s2Ia2Y1UWcWzy1x7UHa7apd59vOCLKb728t2cut37Fpu95urca4AqPFcaIZ1XDUJC.ntKW2VdhSdBswy1nrUHa0UWUCLv.5zm9zZim8LEpbca4xKqXwhoN5nCs9ydVQOHtKrxTO6YqW1tsL29.V2c2iVe8huOfUockYNyN6rZzQGUCze+ZoJ3rvb5omVm6bmSwhMnVbQ51Rz7htuD.nNKe2SdD51R2ntx0MZEsX1e0YmoqRVgcaY7JraKCGNrbKWWbt2YfYk1cnFYjiiQQ1qQCpj6CIIWW51RzbiouD.nNKZznJQhDJTnPUzYJoqqqRDOgR3dD61xDIJ0Qa4961xJXNRbccyeVXVxwEsftxrRttQcUlL1iTWeJwYaIZ9QnL.f5jB6dxacqaoSbhSTx0AUpToz2+8eud9y2Ue1m8Y5Tmr7caYgcm4YNyYTnPGd2VlcsjsS90RVI61x8VyW4Femc1kbNjo5L+31N6IGPO8zygdFXdvwu0dmH.80WeksaKu68tm1dqszMuwM0.wJ8YgIPPGqoL.f5jbcaoqqqd9yedQWP84j+rvrkVzye9yKa2Vt4lapt5pK0Vaspc284EMv2Farg5t6t0INwIzt69b4ThfSRupaKO0oNk1Y2cJ5g789NCLKQWYlSt09V6czt1Zyx2clEdhCTImEl.AcToL.fZrToRou+teud9tOW24N2Qs0VaxyyqDiOo99u+tupBYUP2Vd26dWsyt6juBYEsaK+9uW6r6t5129Vp816PoSmp3caYhD562WEx5ToRkVtGR2VlqRZiO93Gotsb7wGW81auksaKu6cuq1Zqsz327lpuA5Wo8RqvkXOcCnY.UJC.nFa80WW8OP+5DscB8rM130B0bPE1skO6YOqrUHqv8Crm8rmUzJjUX2VVpy.ybxUYpt6tas15qWj5i8ptsrmd6QqsZw6Jybx0sk80eeZkkOJmElwzRKsXYGOPyB59R.fZMiQQciVVDEx7c..P.OkDQAQ0tg7UC+UmskUxheuRG+9OaKqjqq1qaKKeWbFJTH4Foxuecbbx18oopjytS51Rb7D0BF.nVyZU73Ip3M2Tq0p3wiW10bVgiuRNKLsV6Q5rszZU9tsrTSgh0Zqny.yBGelL4NKLqfEp+dSfSkd8AZVPnL.fZrHtt5K9xOWsDskJJXlqqq9hu3KTas0lB4T9wGcuwehSbhRNkjQiFU24N2Qm4LmtrScYtw+Ye1moN5nCEpDc4XKszh9rO6yTmc1YEccaokVzsu8sU2c2cE08jszRK5V25Vks6LAZ1vZJC...vGf0TF...fO.gx....7AHTF...PClUDJC...vWfPY....MXFQnL....eABkA...3CPnL....e.BkA...3CPnL....e.BkA...3CPnL....e.mr6grUg2ziwbd7734wyimGOOdd7734wm+C++Ou0EbtQfYrPE.....IUjSD4pPfIH" ],
									"embed" : 1,
									"id" : "obj-1",
									"maxclass" : "fpic",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "jit_matrix" ],
									"patching_rect" : [ 7.5, 5.0, 613.0, 804.0 ]
								}

							}
 ],
						"lines" : [  ]
					}
,
					"patching_rect" : [ 684.0, 53.5, 66.0, 23.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"fontsize" : 13.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p diagram"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"id" : "obj-47",
					"linecount" : 5,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 187.0, 357.0, 69.0, 79.0 ],
					"text" : "sets the length of the link to its current length",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-45",
					"linecount" : 5,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 103.0, 357.0, 81.0, 79.0 ],
					"text" : "resets damping and inertial force of the link.",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-39",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 471.0, 487.0, 283.0, 21.0 ],
					"text" : "send messages to named objects using pmpd.s"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-33",
					"linecount" : 6,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 22.0, 357.0, 83.0, 94.0 ],
					"text" : "resets position of masses and sets speed of the link to zero",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 24.0,
					"id" : "obj-25",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 22.0, 20.0, 122.0, 33.0 ],
					"text" : "pmpd.link"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 2,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 107.0, 79.0, 700.0, 579.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 13.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 0,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "vb01",
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 43.0, 409.0, 615.0, 21.0 ],
									"text" : "note : D2 is damping associated with the mass but not with the link. So it's not affected by Lmin and Lmax"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 43.0, 322.0, 255.0, 50.0 ],
									"text" : "Case Lmin = 10 and Lmax = very positive :\n\nAt L = 10, this is an attractive link only"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"linecount" : 5,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 43.0, 197.0, 480.0, 79.0 ],
									"text" : "Case Lmin = 0 and Lmax = 10 :\n\nAt L = 0, links can break (a bit like a magnet.)\n\nAt L = 10, this is a repulsive-only link useful for interaction between two structures."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 43.0, 136.0, 410.0, 21.0 ],
									"text" : "If the length of the link is > Lmax then the force of the link will be null"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 43.0, 96.0, 398.0, 21.0 ],
									"text" : "If the length of the link is < Lmin then the force of the link will be null"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 43.0, 44.0, 282.0, 21.0 ],
									"text" : "Lmin and Lmax are useful for non-linear links"
								}

							}
 ],
						"lines" : [  ]
					}
,
					"patching_rect" : [ 657.0, 116.5, 93.0, 23.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"fontsize" : 13.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p minmax_info"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-20",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 45.0, 567.0, 360.0, 50.0 ],
					"text" : "value range:\nK, D, D2 are positive. Negative values make strange (non physical) things. High values can cause numerical instability."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-44",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 494.0, 107.5, 79.0, 50.0 ],
					"text" : "damping of the masses speed",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-43",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 415.0, 107.5, 77.0, 50.0 ],
					"text" : "damping of the link deformation",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-41",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 353.0, 107.5, 59.0, 50.0 ],
					"text" : "set stiffness/rigidity",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-40",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 115.0, 236.5, 128.0, 50.0 ],
					"text" : "outputs forces, according to the last masses positions"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-38",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 278.5, 116.5, 68.0, 36.0 ],
					"text" : "set length of link",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 549.0, 310.0, 113.0, 21.0 ],
					"text" : "position of mass 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 549.0, 274.0, 113.0, 21.0 ],
					"text" : "position of mass 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 390.0, 41.0, 82.0, 50.0 ],
					"text" : "L: length\nK: stiffness\nD: viscosity"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-35",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 429.0, 372.0, 244.0, 21.0 ],
					"text" : "args: receive address, L, K, D, D2"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-30",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 618.5, 518.0, 50.0, 23.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 618.5, 547.0, 51.0, 23.0 ],
					"text" : "setL $1"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-34",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 549.0, 547.0, 50.0, 23.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 495.0, 548.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 549.0, 601.0, 84.0, 23.0 ],
					"text" : "pmpd.s hoho"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-15",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 497.0, 308.0, 50.0, 23.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 198.0, 310.0, 45.0, 23.0 ],
					"text" : "resetL"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-1",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 501.0, 160.0, 50.0, 23.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 501.0, 188.0, 61.0, 23.0 ],
					"text" : "setD2 $1"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-16",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 429.0, 160.0, 50.0, 23.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 429.0, 188.0, 53.0, 23.0 ],
					"text" : "setD $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 383.0, 438.0, 48.0, 21.0 ],
					"text" : "force 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 305.0, 438.0, 48.0, 21.0 ],
					"text" : "force 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 589.0, 188.0, 165.0, 23.0 ],
					"text" : "setLmin -100, setLmax 100"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-14",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 370.0, 413.0, 74.0, 23.0 ]
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-13",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 292.0, 413.0, 74.0, 23.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 246.5, 245.0, 33.0, 33.0 ]
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-8",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 361.0, 160.0, 50.0, 23.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 361.0, 188.0, 53.0, 23.0 ],
					"text" : "setK $1"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-7",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 292.0, 160.0, 50.0, 23.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 292.0, 188.0, 51.0, 23.0 ],
					"text" : "setL $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 292.0, 371.0, 97.0, 23.0 ],
					"text" : "pmpd.link hoho"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 22.0, 55.0, 300.0, 36.0 ],
					"text" : "link between 2 masses\nget position of masses, output forces to apply"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 45.0, 310.0, 37.0, 23.0 ],
					"text" : "reset"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 121.0, 310.0, 45.0, 23.0 ],
					"text" : "resetF"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-23",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 497.0, 273.0, 50.0, 23.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 1 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "pmpd.link.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "pmpd.s.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0
	}

}
