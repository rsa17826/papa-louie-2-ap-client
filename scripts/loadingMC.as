package
{
  import flash.display.MovieClip;

  [Embed(source="/_assets/assets.swf", symbol="symbol27")]
  public dynamic class loadingMC extends MovieClip
  {

    public var bar:MovieClip;

    public var loader_bar:MovieClip;

    public function loadingMC()
    {
      super();
      addFrameScript(1, this.frame28, 2, this.frame65);
    }

    internal function frame28():*
    {
      gotoAndStop(28);
    }

    internal function frame65():*
    {
      gotoAndStop(65);
    }
  }
}
