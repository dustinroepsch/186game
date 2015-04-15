package constant {
	public class EmbedConst 
	{
		[Embed(source="../../assets/sheet.png")]
		public static const ATLAS_IMAGE:Class;
		
		[Embed(source="../../assets/sheet.xml", mimeType="application/octet-stream")]
		public static const ATLAS_XML:Class;
	}
}