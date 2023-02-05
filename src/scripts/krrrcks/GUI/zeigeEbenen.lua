function zeigeEbenen()
  if not table.is_field(gmcp, "comm.channel") then return end

  fg(farben.vg.ebenen)
  bg(farben.hg.ebenen)
  echo(gmcp.comm.channel.msg)
  resetFormat()
end
