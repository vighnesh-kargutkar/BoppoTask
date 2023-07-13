using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using System.IO;
namespace Glossary.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class GlossaryController:ControllerBase
    {
        private static List<GlossaryItem>Glossary=new List<GlossaryItem>
        {
            new GlossaryItem
            {
                Term="HTML", Definition="HyperText Markup language"
            },
            new GlossaryItem
            {
                Term="MVC", Definition="Model View Control"
            },
            new GlossaryItem
            {
                Term="OpenID", Definition="An Open StandardFor Autehntication"
            }
        };
        [HttpGet]
        public ActionResult<List<GlossaryItem>>Get()
        {
            return Ok(Glossary);
        }
        [HttpGet]
        [Route("{term}")]
        public ActionResult<GlossaryItem>Get(string term)
        {
            var glossaryItem=Glossary.Find(item=>item.Term.Equals(term,StringComparison.InvariantCultureIgnoreCase));
            if(glossaryItem==null)
            {return NotFound();
            }else
            {
                return Ok(glossaryItem);
            }
        }
        [HttpPost]
        public ActionResult Post(GlossaryItem glossaryItem)
        {       
            var existingGlossaryItem=Glossary.Find(item=>item.Term.Equals(glossaryItem.Term,StringComparison.InvariantCultureIgnoreCase));
            if (existingGlossaryItem!= null)
            {
                return Conflict("Cannnot create the term because italready exists");
            }
            else
            {
                Glossary.Add(glossaryItem);
                var resourseUrl=Path.Combine(Request.Path.ToString(),Uri.EscapeUriString(glossaryItem.Term));
                return Created(resourseUrl,glossaryItem);
            }
            }
            [HttpPut]
            public ActionResult Put(GlossaryItem glossaryItem)
            {
                var existingGlossaryItem=Glossary.Find(item=>item.Term.Equals(glossaryItem.Term,StringComparison.InvariantCultureIgnoreCase));
                if (existingGlossaryItem==null)
                {
                    return BadRequest("Cannnot update a non existingTerm");
                }
                else
                {
                    existingGlossaryItem.Definition=glossaryItem.Definition;
                    return Ok();
                }
            }
            [HttpDelete]
            [Route("{term}")]
            public ActionResult Delete(string term)
            {
                var glossaryItem=Glossary.Find(item=>item.Term.Equals(term,StringComparison.InvariantCultureIgnoreCase));
                if(glossaryItem==null)
                {return NotFound();
                }else
                {
                    Glossary.Remove(glossaryItem);
                    return NoContent();
                }
            } 
        }
}